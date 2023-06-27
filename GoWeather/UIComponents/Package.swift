// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "UIComponents",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "UIComponents",
            targets: ["CustomElements", "DesignConstants"]
        ),
        .library(
            name: "CustomElements",
            targets: ["CustomElements"]
        ),
        .library(
            name: "DesignConstants",
            targets: ["DesignConstants"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CustomElements",
            dependencies: []
        ),
        .target(
            name: "DesignConstants",
            dependencies: []
        ),
    ]
)
