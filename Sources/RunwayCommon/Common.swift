
// // xxx docs, helper protocol, public because other protocols depend on it
// public protocol Identifiable: CustomStringConvertible, /* Equatable, */ Hashable {

//     // TODO init from description?
// }


// public struct Namespace: Identifiable {
//     static let SEPARATOR = "."
//     var parts: [String]

//     public init(_ first:String, _ others:String...) {
//         parts = [first] + others
//     }

//     public var description: String {
//         return parts.joined(separator: Namespace.SEPARATOR)
//     }
    
//     public static func ==(lhs: Namespace, rhs: Namespace) -> Bool {
//         return lhs.parts == rhs.parts
//     }
    
//     public var hashValue: Int {
//         return description.hashValue
//     }
// }

// public protocol Identifier: Identifiable {
//     init(_ id:String)
// }

// public protocol QualifiedIdentier: Identifiable {
//     init(ns:Namespace, _ id:String)
// }

// public struct QualifiedIdentierConstants {
//     static let SEPARATOR = "/"

//     private init() {
//     }
// }

// public struct Id<T>:  Identifier {
//     var id:String

//     public init(_ id:String) {
//         self.id = id
//     }

//     public var description: String {
//         return id
//     }

//     public static func ==(lhs: Id<T>, rhs: Id<T>) -> Bool {
//         return lhs.id == rhs.id
//     }

//     public var hashValue: Int {
//         return id.hashValue
//     }
// }

// public struct QualifiedId<T>: QualifiedIdentier {
//     var ns: Namespace
//     var id: Id<T>

//     // XXX rethink type structure to allow any Identifier (not just the concrete Id<T>)

//     public init(ns:Namespace, _ id:Id<T>) {
//         self.id = id
//         self.ns = ns
//     }

//     public init(ns:Namespace, _ idString:String) {
//         self.init(ns:ns, Id<T>(idString))
//     }

//     public var description: String {
//         return ns.description + QualifiedIdentierConstants.SEPARATOR + id.description
//     }

//     public static func ==(lhs: QualifiedId<T>, rhs: QualifiedId<T>) -> Bool {
//         // XXX any QualifiedIdentifieables should be comparable by parts
//         return lhs.id == rhs.id && lhs.ns == rhs.ns
//     }

//     public var hashValue: Int {
//         return description.hashValue
//     }
// }
