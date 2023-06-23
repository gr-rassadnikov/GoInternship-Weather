// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Modules",
            targets: ["Weather", "DomainModels"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Weather",
            dependencies: ["DomainModels"]
        ),
        .target(
            name: "DomainModels",
            dependencies: []
        ),
    ]
)
