// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-Maio-iOS-Adapter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPMaioAdapter",
            targets: ["VAMPMaioAdapterTarget", "MaioSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPMaioAdapterTarget",
            dependencies: [
                .target(name: "VAMPMaioAdapter"),
                .target(name: "MaioSDK"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
            ],
            path: "VAMPMaioAdapterTarget"
        ),
        .binaryTarget(
            name: "VAMPMaioAdapter",
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPMaioAdapter-v2.1.600.zip",
            checksum: "e3f1ce906eb09057efd30f9bae1c3391bd5785d7d08aa40f1bd63ae1ffa8e3b8"
        ),
        .binaryTarget(
            name: "MaioSDK",
            url: "https://github.com/imobile/MaioSDK-v2-iOS/releases/download/v2.1.6/Maio.xcframework.zip",
            checksum: "20d8762c7aa46fa547480f40fad2eab99927c11468b5bfbd3c404c9a54f9c790"
        )
    ]
)