// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Stylist",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
    ],
    products: [
        .library(name: "Stylist", targets: ["Stylist"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "6.2.2"),
        .package(url: "https://github.com/tomasszabo/KZFileWatchers.git",
                 revision: "47c891724638bd16cb83d87ff75c62177b7b73b8"),
    ],
    targets: [
        .target(
            name: "Stylist",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "KZFileWatchers", package: "KZFileWatchers"),
            ],
            path: "Stylist",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "StylistTests",
            dependencies: ["Stylist", .product(name: "Yams", package: "Yams")],
            path: "Tests",
            exclude: ["LinuxMain.swift", "Info.plist"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
