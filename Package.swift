// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "IGListKit",
    platforms: [ .iOS(.v9),
                 .tvOS(.v9),
                 .macOS(.v10_11),
    ],
    products: [
        .library(name: "IGListDiffKit",
                 type: .static,
                 targets: ["IGListDiffKit"]),
        .library(name: "IGListKit",
                 type: .static,
                 targets: ["IGListKit"]),
        .library(name: "IGListSwiftKit",
                 type: .static,
                 targets: ["IGListSwiftKit"]),
    ],
    targets: [
        .target(
            name: "IGListDiffKit",
            path: "spm/Sources/IGListDiffKit",
            cSettings: [.define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))]
        ),
        .target(
            name: "IGListKit",
            dependencies: ["IGListDiffKit"],
            path: "spm/Sources/IGListKit",
            cSettings: [.define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))]
        ),
        .target(
            name: "IGListSwiftKit",
            dependencies: ["IGListKit"],
            path: "Source/IGListSwiftKit",
            cSettings: [.define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))]
        ),
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
