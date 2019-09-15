load("//scala:scala.bzl", "scala_binary")
load(
    "//scala:scala_cross_version.bzl",
    "scala_mvn_artifact",
    _default_scala_version = "default_scala_version",
    _extract_major_version = "extract_major_version",
)
load(
    "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl",
    _scala_maven_import_external = "scala_maven_import_external",
)

def tut_repositories(
        scala_version = _default_scala_version(),
        server_urls = ["https://dl.bintray.com/tpolecat/maven/"]):
    major_version = _extract_major_version(scala_version)

    scala_jar_shas = {
        "2.11": {
            "tut_core": "e72f620ba6d79827b6d4ea29ff71398c7e4e1cddef636515d7289dde8a7f196b",
        },
        "2.12": {
            "tut_core": "48173af56de62c9a3b81610d5d2de115598acc697d1412918d49c256f1bc48e7",
        },
        "2.13": {
            "tut_core": "cc82f10489cd0214d52a11f7b9af6206901c84f2341d0ef90c9e98bb8ba63dad",
        },
    }

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_tpolecat_tut_core",
        artifact = scala_mvn_artifact(
            "org.tpolecat:tut-core:0.6.8",
            major_version,
        ),
        artifact_sha256 = scala_jar_shas[major_version]["tut_core"],
        licenses = ["notice"],
        server_urls = server_urls,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/tut/tut_core",
        actual = "@io_bazel_rules_scala_org_tpolecat_tut_core",
    )

def scala_tut_doc(**kw):
    name = kw["name"]
    deps = kw.get("deps", [])
    src = kw["src"]
    tool = "%s_compiler" % name
    scala_binary(
        name = tool,
        main_class = "io.bazel.rules_scala.tut_support.TutCompiler",
        deps = deps + [
            "@io_bazel_rules_scala//src/scala/io/bazel/rules_scala/tut_support:tut_compiler_lib",
            "//external:io_bazel_rules_scala/dependency/scala/scala_reflect",
        ],
    )
    native.genrule(
        name = name,
        srcs = [src],
        outs = ["%s_tut.md" % name],
        tools = [tool],
        cmd = "./$(location %s) $(location %s) \"$@\" >/dev/null" % (tool, src),
    )
