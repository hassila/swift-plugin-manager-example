// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-plugin-manager-example",
    platforms: [
      .macOS(.v12)
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-log", from: "1.0.0"),
      .package(url: "https://github.com/hassila/swift-plugin-manager", branch: "main"),
      .package(url: "https://github.com/hassila/swift-plugin-example-api", branch: "main"),
      .package(url: "https://github.com/hassila/swift-plugin-manager-example-api", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "PluginManagerExample",
            dependencies: [
              .product(name: "Logging", package: "swift-log"),
              .product(name: "PluginManager", package: "swift-plugin-manager"),
              .product(name: "PluginExampleAPI", package: "swift-plugin-example-api"),
              .product(name: "PluginManagerExampleAPI", package: "swift-plugin-manager-example-api")
            ]),
    ]
)
