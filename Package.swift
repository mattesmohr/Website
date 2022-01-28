// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Website",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.54.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.4.0"),
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.0.1"),
        .package(name: "HTMLKit", url: "https://github.com/vapor-community/HTMLKit.git", .branch("main")),
        .package(name: "HTMLKitVaporProvider", url: "https://github.com/vapor-community/htmlkit-vapor-provider.git", .branch("main")),
        .package(name: "HTMLKitComponents", url: "https://github.com/mattesmohr/HTMLKit-Components.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "HTMLKit", package: "HTMLKit"),
                .product(name: "HTMLKitVaporProvider", package: "HTMLKitVaporProvider"),
                .product(name: "HTMLKitComponents", package: "HTMLKitComponents")
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .executableTarget(name: "Run", dependencies: [
            .target(name: "App")
        ]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor")
        ])
    ]
)
