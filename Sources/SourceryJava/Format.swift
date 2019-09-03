
// XXX better formatter stuff

import Sourcery

// TODO text templating

// TODO configurable formater

// TODO constant?
public let INDENT: String = "    ";

public protocol FormatableJava: Formatable {}

// public protocol FormatableJava: Formatable where Lang: Java {
// }

extension File: FormatableJava {
    public func format() -> String {
        return """
        package \(package);

        \(topLevel.format())
        """
    }
}

extension TopLevel: FormatableJava {
    public func format() -> String {
        switch self {
        case let .clazz(clazz):
            return clazz.format()
        case let .interface(interface):
            return interface.format()
        }
    }
}

extension Class: FormatableJava {
    public func format() -> String {
        // XXX hard coded modifiers
        return """
            public final class \(name) {
            \(INDENT + fields.map({$0.format()}).joined(separator:"\n" + INDENT))
            }
            """
    }
}

extension Field: FormatableJava {
    public func format() -> String {
        // XXX modifiers
        return "public final \(type) \(name);"
    }
}

extension Interface: FormatableJava {
    public func format() -> String {
        // XXX hard coded modifiers
        return """
            public final interface \(name) {
            }
            """
    }
}