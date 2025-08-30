// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "cdk-swift",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CashuDevKit",
            targets: ["CashuDevKit"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "cdkFFI",
            url: "https://github.com/asmogo/cdk-swift/releases/download/v0.0.2/cdkFFI.xcframework.zip",
            checksum: "d1b9cf26d95010d95befeacac8cc30b89bc5d0c7bac41531744a3a8022cb8860"
        ),
        .target(
            name: "CashuDevKit",
            dependencies: ["cdkFFI"],
            linkerSettings: [
                .linkedLibrary("resolv")
            ]
        ),
        .testTarget(
            name: "CashuDevKitTests",
            dependencies: ["CashuDevKit"]
        )
    ]
)