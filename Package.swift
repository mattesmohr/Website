// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "Website",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.102.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.11.0"),
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.6.0"),
        .package(url: "https://github.com/vapor-community/HTMLKit.git", branch: "upgrade/htmlkit-3.0-10")
    ],
    targets: [
        .executableTarget(
            name: "Website",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "HTMLKit", package: "HTMLKit")
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(name: "WebsiteTests", dependencies: [
            .target(name: "Website"),
            .product(name: "XCTVapor", package: "vapor")
        ])
    ]
)
