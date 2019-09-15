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

def scala_proto_default_repositories(
        scala_version = _default_scala_version(),
        maven_servers = ["http://central.maven.org/maven2"]):
    major_version = _extract_major_version(scala_version)

    scala_jar_shas = {
        "2.11": {
            "scalapb_plugin": "936fb61e53b502d429273735ec294faee1e716c2648ff0dbbf6fb2260af0539a",
            "protoc_bridge": "b656d142c21f483de68b6519f9ea64881c8ab4cac116b8985d08805107148c05",
            "scalapbc": "b4208edca06f32d47f24b2d89a759127a162ac9e29a4b98dfa6d9a105b27380d",
            "scalapb_runtime": "ab1e449a18a9ce411eb3fec31bdbca5dd5fae4475b1557bb5e235a7b54738757",
            "scalapb_runtime_grpc": "0170ad41fa95f2f5e8318f1c69edafd731467386280b07adce3dc2027f788f33",
            "scalapb_lenses": "f4809760edee6abc97a7fe9b7fd6ae5fe1006795b1dc3963ab4e317a72f1a385",
            "scalapb_fastparse": "5c5d81f90ada03ac5b21b161864a52558133951031ee5f6bf4d979e8baa03628",
        },
        "2.12": {
            "scalapb_plugin": "dce6277e9c618d0cee1dd5141f5bd4155eccd221588c7f1658eaa915f3eb8d33",
            "protoc_bridge": "04116b52f76adc9fac1e83e1a18321c79e332e170e6542953199e3933e5ff375",
            "scalapbc": "62c8b9d145ceab626f1b6812547da69a03f600bb54956b697006cf0cd9418da4",
            "scalapb_runtime": "b905fa66b3fd0fabf3114105cd73ae2bdddbb6e13188a6538a92ae695e7ad6ed",
            "scalapb_runtime_grpc": "925d8d86050991da6e024138fc21a1f2ff4f8aa49c1c5f76c71b330dbaec18d1",
            "scalapb_lenses": "0a2fff4de17d270cea561618090c21d50bc891d82c6f9dfccdc20568f18d0260",
            "scalapb_fastparse": "e8b831a843c0eb5105d42e4b6febfc772b3aed3a853a899e6c8196e9ecc057df",
        },
        "2.13": {
            "scalapb_plugin": "c31f646cc08e39d9da600f89be822e438d01192513ab1689e203811193913ebe",
            "protoc_bridge": "9cb94f540687ce4118f6cf51f29cdb03fed62893255d177a9d3e4090a882b75a",
            "scalapbc": "abeef06dc0aadafaa93f072502c45005b11c73ac701a61720ed53dbb6cfb4578",
            "scalapb_runtime": "10830d6511fc21b997c4acdde6f6700e87ee6791cbe6278f5acd7b352670a88f",
            "scalapb_runtime_grpc": "b7a423020ee9f150b546883c20413ca950530d2811b934debd2c8f3487e68f50",
            "scalapb_lenses": "dfb37387327cc0e262b93a5c3b33638359b4e6d76f59d8070a39c319f7b62ba3",
            "scalapb_fastparse": "5064d3984aab8c48d2dbd6285787ac5c6d84a6bebfc02c6d431ce153cf91dec1",
        },
    }

    scala_version_jar_shas = scala_jar_shas[major_version]

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_plugin",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:compilerplugin:0.9.0",
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["scalapb_plugin"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_plugin",
        actual = "@scala_proto_rules_scalapb_plugin",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_protoc_bridge",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:protoc-bridge:0.7.8",
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["protoc_bridge"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/protoc_bridge",
        actual = "@scala_proto_rules_protoc_bridge",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapbc",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:scalapbc:0.9.0",
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["scalapbc"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapbc",
        actual = "@scala_proto_rules_scalapbc",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_runtime",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:scalapb-runtime:0.9.0",
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["scalapb_runtime"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_runtime",
        actual = "@scala_proto_rules_scalapb_runtime",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_runtime_grpc",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:scalapb-runtime-grpc:0.9.0",
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["scalapb_runtime_grpc"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_runtime_grpc",
        actual = "@scala_proto_rules_scalapb_runtime_grpc",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_lenses",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:lenses:0.9.0",
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["scalapb_lenses"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_lenses",
        actual = "@scala_proto_rules_scalapb_lenses",
    )

    fastparse_artifact = {
        "2.11": "com.lihaoyi:fastparse:2.1.2",
        "2.12": "com.lihaoyi:fastparse:2.1.3",
        "2.13": "com.lihaoyi:fastparse:2.1.3",
    }
    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_fastparse",
        artifact = _scala_mvn_artifact(
            fastparse_artifact[major_version],
            major_version,
        ),
        artifact_sha256 = scala_version_jar_shas["scalapb_fastparse"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_fastparse",
        actual = "@scala_proto_rules_scalapb_fastparse",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_core",
        artifact = "io.grpc:grpc-core:1.19.0",
        artifact_sha256 = "3cfaae2db268e4da2609079cecade8434afcb7ab23a126a57d870b722b2b6ab9",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_core",
        actual = "@scala_proto_rules_grpc_core//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_stub",
        artifact = "io.grpc:grpc-stub:1.19.0",
        artifact_sha256 = "711dad5734b4e8602a271cb383eda504d6d1bf5385ced045a0ca91176ae73821",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_stub",
        actual = "@scala_proto_rules_grpc_stub//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_protobuf",
        artifact = "io.grpc:grpc-protobuf:1.19.0",
        artifact_sha256 = "37e50ab7de4a50db4c9f9a2f095ffc51df49e36c9ab7fffb1f3ad20ab6f47022",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_protobuf",
        actual = "@scala_proto_rules_grpc_protobuf//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_netty",
        artifact = "io.grpc:grpc-netty:1.19.0",
        artifact_sha256 = "08604191fa77ef644cd9d7323d633333eceb800831805395a21b5c8e7d02caf0",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_netty",
        actual = "@scala_proto_rules_grpc_netty//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_context",
        artifact = "io.grpc:grpc-context:1.19.0",
        artifact_sha256 = "8f4df8618c500f3c1fdf88b755caeb14fe2846ea59a9e762f614852178b64318",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_context",
        actual = "@scala_proto_rules_grpc_context//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_guava",
        # io.grpc:grpc-core:1.19.0 defines a dependency on guava 26.0-android
        # see https://search.maven.org/artifact/io.grpc/grpc-core/1.19.0/jar
        artifact = "com.google.guava:guava:26.0-android",
        artifact_sha256 = "1d044ebb866ef08b7d04e998b4260c9b52fab6e6d6b68d207859486bb3686cd5",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/guava",
        actual = "@scala_proto_rules_guava//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_google_instrumentation",
        artifact = "com.google.instrumentation:instrumentation-api:0.3.0",
        artifact_sha256 = "671f7147487877f606af2c7e39399c8d178c492982827305d3b1c7f5b04f1145",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/google_instrumentation",
        actual = "@scala_proto_rules_google_instrumentation//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec",
        artifact = "io.netty:netty-codec:4.1.32.Final",
        artifact_sha256 = "dbd6cea7d7bf5a2604e87337cb67c9468730d599be56511ed0979aacb309f879",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec",
        actual = "@scala_proto_rules_netty_codec//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec_http",
        artifact = "io.netty:netty-codec-http:4.1.32.Final",
        artifact_sha256 = "db2c22744f6a4950d1817e4e1a26692e53052c5d54abe6cceecd7df33f4eaac3",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec_http",
        actual = "@scala_proto_rules_netty_codec_http//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec_socks",
        artifact = "io.netty:netty-codec-socks:4.1.32.Final",
        artifact_sha256 = "fe2f2e97d6c65dc280623dcfd24337d8a5c7377049c120842f2c59fb83d7408a",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec_socks",
        actual = "@scala_proto_rules_netty_codec_socks//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec_http2",
        artifact = "io.netty:netty-codec-http2:4.1.32.Final",
        artifact_sha256 = "4d4c6cfc1f19efb969b9b0ae6cc977462d202867f7dcfee6e9069977e623a2f5",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec_http2",
        actual = "@scala_proto_rules_netty_codec_http2//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_handler",
        artifact = "io.netty:netty-handler:4.1.32.Final",
        artifact_sha256 = "07d9756e48b5f6edc756e33e8b848fb27ff0b1ae087dab5addca6c6bf17cac2d",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_handler",
        actual = "@scala_proto_rules_netty_handler//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_buffer",
        artifact = "io.netty:netty-buffer:4.1.32.Final",
        artifact_sha256 = "8ac0e30048636bd79ae205c4f9f5d7544290abd3a7ed39d8b6d97dfe3795afc1",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_buffer",
        actual = "@scala_proto_rules_netty_buffer//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_transport",
        artifact = "io.netty:netty-transport:4.1.32.Final",
        artifact_sha256 = "175bae0d227d7932c0c965c983efbb3cf01f39abe934f5c4071d0319784715fb",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_transport",
        actual = "@scala_proto_rules_netty_transport//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_resolver",
        artifact = "io.netty:netty-resolver:4.1.32.Final",
        artifact_sha256 = "9b4a19982047a95ea4791a7ad7ad385c7a08c2ac75f0a3509cc213cb32a726ae",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_resolver",
        actual = "@scala_proto_rules_netty_resolver//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_common",
        artifact = "io.netty:netty-common:4.1.32.Final",
        artifact_sha256 = "cc993e660f8f8e3b033f1d25a9e2f70151666bdf878d460a6508cb23daa696dc",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_common",
        actual = "@scala_proto_rules_netty_common//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_handler_proxy",
        artifact = "io.netty:netty-handler-proxy:4.1.32.Final",
        artifact_sha256 = "10d1081ed114bb0e76ebbb5331b66a6c3189cbdefdba232733fc9ca308a6ea34",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_handler_proxy",
        actual = "@scala_proto_rules_netty_handler_proxy//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_api",
        artifact = "io.opencensus:opencensus-api:0.22.1",
        artifact_sha256 = "62a0503ee81856ba66e3cde65dee3132facb723a4fa5191609c84ce4cad36127",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_api",
        actual = "@scala_proto_rules_opencensus_api//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_impl",
        artifact = "io.opencensus:opencensus-impl:0.22.1",
        artifact_sha256 = "9e8b209da08d1f5db2b355e781b9b969b2e0dab934cc806e33f1ab3baed4f25a",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_impl",
        actual = "@scala_proto_rules_opencensus_impl//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_disruptor",
        artifact = "com.lmax:disruptor:3.4.2",
        artifact_sha256 = "f412ecbb235c2460b45e63584109723dea8d94b819c78c9bfc38f50cba8546c0",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/disruptor",
        actual = "@scala_proto_rules_disruptor//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_impl_core",
        artifact = "io.opencensus:opencensus-impl-core:0.22.1",
        artifact_sha256 = "04607d100e34bacdb38f93c571c5b7c642a1a6d873191e25d49899668514db68",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_impl_core",
        actual = "@scala_proto_rules_opencensus_impl_core//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_contrib_grpc_metrics",
        artifact = "io.opencensus:opencensus-contrib-grpc-metrics:0.22.1",
        artifact_sha256 = "3f6f4d5bd332c516282583a01a7c940702608a49ed6e62eb87ef3b1d320d144b",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_contrib_grpc_metrics",
        actual = "@scala_proto_rules_opencensus_contrib_grpc_metrics//jar",
    )
