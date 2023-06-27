// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Network",
            targets: ["WeatherClient"]
        ),
        .library(
            name: "WeatherClient",
            targets: ["WeatherClient"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WeatherClient",
            dependencies: []
        ),
    ]
)
