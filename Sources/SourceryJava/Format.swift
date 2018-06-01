
// XXX better formatter stuff

import Sourcery

// TODO text templating

// TODO configurable formater

// TODO constant?
public let INDENT: String = "    ";

extension File: Formatable {
    public func format() -> String {
        return """
        package \(package);

        \(topLevel.format())
        """
    }
}

extension TopLevel: Formatable {
    public func format() -> String {
        switch self {
        case let .clazz(clazz):
            return clazz.format()
        case let .interface(interface):
            return interface.format()
        }
    }
}

extension Class: Formatable {
    public func format() -> String {
        // XXX hard coded modifiers
        return """
            public final class \(name) {
            \(INDENT + fields.map({$0.format()}).joined(separator:"\n" + INDENT))
            }
            """
    }
}

extension Field: Formatable {
    public func format() -> String {
        // XXX modifiers
        return "public final \(type) \(name);"
    }
}

extension Interface: Formatable {
    public func format() -> String {
        // XXX hard coded modifiers
        return """
            public final interface \(name) {
            }
            """
    }
}