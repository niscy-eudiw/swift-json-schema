// swift-tools-version: 5.10

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "swift-json-schema",
  platforms: [
    .macOS(.v14),
    .iOS(.v14),
    .watchOS(.v10),
    .tvOS(.v17),
    .macCatalyst(.v17),
    .visionOS(.v1),
  ],
  products: [
    .library(
      name: "JSONSchema",
      targets: ["JSONSchema"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.0.0"),
    .package(url: "https://github.com/swiftlang/swift-syntax", from: "600.0.1"),
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.6"),
  ],
  targets: [
    // Library that defines the JSON schema related types.
    .target(
      name: "JSONSchema",
      resources: [
        .process("Resources")
      ]
    ),
    .testTarget(
      name: "JSONSchemaTests",
      dependencies: ["JSONSchema"],
      resources: [
        .copy("JSON-Schema-Test-Suite")
      ]
    ),
  ]
)
