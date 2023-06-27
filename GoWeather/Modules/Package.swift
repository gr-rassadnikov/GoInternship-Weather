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
    dependencies: [
        .package(url: "https://github.com/danielgindi/Charts", from: "5.0.0"),
        .package(path: "Network"),
        .package(path: "UIComponents"),
    ],
    targets: [
        .target(
            name: "Weather",
            dependencies: ["DomainModels",
                           .product(name: "WeatherClient", package: "Network"),
                           .product(name: "CustomElements", package: "UIComponents"),
                           .product(name: "DesignConstants", package: "UIComponents"),
                          ]
        ),
        .target(
            name: "DomainModels",
            dependencies: [
                .product(name: "WeatherClient", package: "Network"),
            ]
        ),
    ]
)
