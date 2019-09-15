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

def specs2_version():
    return "4.7.0"

def specs2_repositories(
        scala_version = _default_scala_version(),
        maven_servers = ["http://central.maven.org/maven2"]):
    major_version = _extract_major_version(scala_version)

    scala_jar_shas = {
        "2.11": {
            "specs2_common": "cb066b5bad6a2aef93077086e5311c7c5f19500a138f67d3f9c8f32b14e4bea5",
            "specs2_core": "d4e52b207f4e5834b882ac3d7a2f8e8f2af9fa5fe30c7a45d1e63bb6fdd150c4",
            "specs2_fp": "ea83c6389b1cfb465d0b9bd8d349753837aa05fe5cd418f32560c897e5d3648f",
            "specs2_matcher": "16c6d6730e45bc7387b766af20fa2f65cef6df0aa22a1ba40fb844f65110fd0f",
        },
        "2.12": {
            "specs2_common": "3adf0501036081f8314853030775dda79d879dbd9b57f4ec6836f2b220f84dfa",
            "specs2_core": "f34c0bddab74432cb0524f18ddae92369936cfd40f76f896857c2f193357018d",
            "specs2_fp": "279baac59790c83f7de0de03ad7fc468f4dd5594f94dc2bc12e35d8d7694c4a1",
            "specs2_matcher": "e15a253fed025db193c63a188eb212c2bb7160ab6bb70a9a841bbc2686bca18b",
        },
        "2.13": {
            "specs2_common": "a385c79f9df7f908657108a765ba32bff0fb21415154aa9e16fce7e9d501fbd5",
            "specs2_core": "346f16e5a7dba1e6fe84a4476fb0c467f93f85217d39e9beaf50a917ddc90307",
            "specs2_fp": "2110c703d5771dba616e36207e8560a9eba1908eded1cebf0b2561cce54ac6f5",
            "specs2_matcher": "08857c2830b3a1b006a5a3996b5ae5ba5806fd5a1a57aa8db9b413fa89157746",
        },
    }

    scala_version_jar_shas = scala_jar_shas[major_version]

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_common",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-common:" + specs2_version(),
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["specs2_common"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_core",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-core:" + specs2_version(),
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["specs2_core"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_fp",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-fp:" + specs2_version(),
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["specs2_fp"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_matcher",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-matcher:" + specs2_version(),
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["specs2_matcher"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/specs2/specs2",
        actual = "@io_bazel_rules_scala//specs2:specs2",
    )

def specs2_dependencies():
    return ["//external:io_bazel_rules_scala/dependency/specs2/specs2"]
