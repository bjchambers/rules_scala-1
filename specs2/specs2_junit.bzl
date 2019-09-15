load(
    "//specs2:specs2.bzl",
    "specs2_dependencies",
    "specs2_repositories",
    "specs2_version",
)
load("//junit:junit.bzl", "junit_repositories")
load(
    "//scala:scala_cross_version.bzl",
    _default_scala_version = "default_scala_version",
    _extract_major_version = "extract_major_version",
    _scala_mvn_artifact = "scala_mvn_artifact",
)
load(
    "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl",
    _scala_maven_import_external = "scala_maven_import_external",
)

def specs2_junit_repositories(
        scala_version = _default_scala_version(),
        maven_servers = ["http://central.maven.org/maven2"]):
    major_version = _extract_major_version(scala_version)

    specs2_repositories(scala_version, maven_servers)
    junit_repositories()

    scala_jar_shas = {
        "2.11": {
            "specs2_junit": "ca042706414b8a17f3a1cb817e3b6d3704e315403baf7987c39ba06e8962470f",
        },
        "2.12": {
            "specs2_junit": "f69d1524dbfeafca2ab78e19e4cbc6d3bcb724282666f2763e5b108b159678a2",
        },
        "2.13": {
            "specs2_junit": "69e735a320cd23ee1d686226acb0a58544b8c0033c51bfa3812cd1eeaf306b33",
        },
    }

    # Aditional dependencies for specs2 junit runner
    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_junit",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-junit:" + specs2_version(),
            major_version,
        ),
        artifact_sha256 = scala_jar_shas[major_version]["specs2_junit"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/specs2/specs2_junit",
        actual = "@io_bazel_rules_scala_org_specs2_specs2_junit",
    )

def specs2_junit_dependencies():
    return specs2_dependencies() + [
        "//external:io_bazel_rules_scala/dependency/specs2/specs2_junit",
    ]
