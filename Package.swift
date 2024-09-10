// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Website",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.102.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.11.0"),
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.49.0"),
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.6.0"),
        .package(url: "https://github.com/vapor-community/HTMLKit.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "Website",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentKit", package: "fluent-kit"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "HTMLKit", package: "HTMLKit")
            ],
            resources: [
                .copy("Localization")
            ],
            swiftSettings: [
                .enableUpcomingFeature("DisableOutwardActorInference"),
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "WebsiteTests",
            dependencies: [
                .target(name: "Website"),
                .product(name: "XCTVapor", package: "vapor"),
                .product(name: "XCTFluent", package: "fluent-kit")
            ],
            swiftSettings: [
                .enableUpcomingFeature("DisableOutwardActorInference"),
                .enableExperimentalFeature("StrictConcurrency")
            ]
        )
    ]
)
