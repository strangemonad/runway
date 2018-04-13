
public typealias TypeId = String
public typealias Identifier = String
public typealias ClassIdentifier = String

public struct Class {
    var name: ClassIdentifier
    var fields: [ClassField]
    // fields, class modifiers    

    public init(name:ClassIdentifier, fields:[ClassField]) {
        self.name = name
        self.fields = fields
    }
}


public struct ClassField {
    // xxx modifiers
    var type: TypeId
    var name: Identifier

    public init(type: TypeId, name:Identifier) {
        self.type = type
        self.name = name
    }
}

// XXX check / enforce style?

// TODO(shawn) string templating
// investigate Stencil https://github.com/kylef/Stencil

extension Class: CustomStringConvertible {
    public var description: String {
        return """
        public final class \(name) {
            \(fields.map({$0.description}).joined(separator:"\n"))
        }
        """
    }
}


extension ClassField: CustomStringConvertible {
    public var description: String {
        return "public \(type) \(name);"
    }
}



