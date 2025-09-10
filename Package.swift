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
            url: "https://github.com/asmogo/cdk-swift/releases/download/v0.0.24/cdkFFI.xcframework.zip",
            checksum: "e95c296ddceb2f9fecb8d3c6f6b1a6c86ddd5139375581725a1b80e3c2a9df71"
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