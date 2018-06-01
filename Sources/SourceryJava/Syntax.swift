
public struct File {
    var package: String
    var topLevel: TopLevel

    public init(package:String, topLevel: TopLevel) {
        self.package = package
        self.topLevel = topLevel
    }
}

public enum TopLevel {
    // XXX naming
    // XXX better subtyping?

    case clazz(_: Class)
    case interface(_: Interface)
}


// Any valid java identifier
public typealias Identifier = String

// Class or interface identifier (subset of allowed identifiers)
public typealias TypeIdentifier = String


public struct Class {
    var name: TypeIdentifier
    var fields: [Field]
    // xxx methods

    // XXX class modifiers
    // XXX builder validation or ClassName type
    // XXX doc and javadoc

    // XXX "shadow" properties like implicit imports?


    public init(name:TypeIdentifier, fields:[Field]) {
        self.name = name
        self.fields = fields
    }
}

public struct Field {
    // XXX both fq type id vs bare type id
    var type: TypeIdentifier
    var name: Identifier
    // XXX modifiers
    // XXX name validation
    // XXX how should type work?

    public init(type: TypeIdentifier, name:Identifier) {
        self.type = type
        self.name = name
    }
}

public struct Interface {
    var name: TypeIdentifier

    // XXX how much can be shared with Class?
}


// method, blocks (e.g basic blocks), ...


// TODO(shawn) string templating
// investigate Stencil https://github.com/kylef/Stencil

// extension Class: CustomStringConvertible {
//     public var description: String {
//         return """
//         public final class \(name) {
//             \(fields.map({$0.description}).joined(separator:"\n"))
//         }
//         """
//     }
// }


// extension ClassField: CustomStringConvertible {
//     public var description: String {
//         return "public \(type) \(name);"
//     }
// }


