import Foundation

/// Build settings.
public typealias BuildSettings = [String: BuildSettingsValue]

public enum BuildSettingsValue: Codable {
    case string(String)
    case array([String])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([String].self) {
            self = .array(value)
        } else {
            throw DecodingError.typeMismatch(
                String.self,
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Cannot decode BuildSettingsValue"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .string(value):
            try container.encode(value)

        case let .array(value):
            try container.encode(value)
        }
    }
}

extension BuildSettingsValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension BuildSettingsValue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: String...) {
        self = .array(elements)
    }
}
