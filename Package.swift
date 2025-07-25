// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-Maio-iOS-Adapter",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPMaioAdapter",
            targets: ["VAMPMaioAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
        .package(
            url: "https://github.com/imobile/MaioSDK-v2-iOS",
            exact: "2.1.6"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPMaioAdapterTarget",
            dependencies: [
                .target(name: "VAMPMaioAdapter"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
                .product(name: "MaioSDK", package: "MaioSDK-v2-iOS"),
            ],
            path: "VAMPMaioAdapterTarget"
        ),
        .binaryTarget(
            name: "VAMPMaioAdapter",
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPMaioAdapter-v2.1.600.zip",
            checksum: "e3f1ce906eb09057efd30f9bae1c3391bd5785d7d08aa40f1bd63ae1ffa8e3b8")
    ]
)