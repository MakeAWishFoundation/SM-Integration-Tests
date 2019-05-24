import Foundation
import Yams
import PathKit
import Commander

// MARK: - MockConfiguration configuration

public struct MockConfiguration {
    public var sources: Sources
    public var output: String
    public var targets: [String]
    public var testable: [String]
    public var `import`: [String]
}

// MARK: - Codable

extension MockConfiguration: Codable {
    public enum CodingKeys: String, CodingKey {
        case sources
        case output
        case targets
        case testable
        case `import` = "import"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        sources = try container.decode(.sources)
        output = try container.decode(.output)
        targets = (try? container.decode([String].self, forKey: .targets)) ?? []
        testable = (try? container.decode([String].self, forKey: .testable)) ?? []
        `import` = (try? container.decode([String].self, forKey: .import)) ?? []
    }
}

// MARK: - MockConfiguration config and Sources

public extension MockConfiguration {

    init(config: LegacyConfiguration) {
        self.sources = config.sources.sorted()
        self.output = config.output
        self.testable = (config.args?.testable ?? config.args?.swiftyMocky?.testable ?? []).sorted()
        self.import = (config.args?.import ?? config.args?.swiftyMocky?.import ?? []).sorted()
        self.targets = [] // TODO: Resolve targets
    }

    func configuration(template: Path) -> LegacyConfiguration {
        let output: String = {
            if self.output.hasPrefix("./") {
                return self.output
            } else {
                return "./\(self.output)"
            }
        }()
        return LegacyConfiguration(
            sources: sources,
            templates: [template.string],
            output: output,
            args: LegacyConfiguration.Arguments(
                swiftyMocky: LegacyConfiguration.Configuration(
                    import: `import`,
                    testable: testable
                ),
                import: nil,
                testable: nil
            )
        )
    }

    struct Sources: Codable {
        var include: [String]
        var exclude: [String]?

        func sorted() -> Sources {
            return Sources(include: include.sorted(), exclude: exclude?.sorted())
        }
    }
}
