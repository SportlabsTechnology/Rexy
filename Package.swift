// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "Rexy",
  products: [
    .library(name: "Rexy", targets: ["Rexy"])
  ],
  targets: [
    .target(
      name: "Rexy",
      path: "Sources"
    ),
    .testTarget(
      name: "RexyTests",
      dependencies: ["Rexy"],
      path: "Tests"
    )
  ]
)
