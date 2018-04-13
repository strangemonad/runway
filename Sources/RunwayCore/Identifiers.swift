// // The type aliases at the bottom are the crux of the matter



// /**
//  * Struct ModulePath is an array of module id's with size >=1
//  */
// public struct ModulePath: CustomStringConvertible, Hashable {
//     static let LONG_ID_SEPARATOR = "."
//     var ids: [Id<Module>]

//     public init(_ rootModId:Id<Module>, _ modIds:Id<Module>...) {
//         self.ids = [rootModId] + modIds
//     }

//     // TODO(shawn) String initializer permutations

//     public var description: String {
//         let qualified = ids.map({$0.description})
//         return qualified.joined(separator: ModulePath.LONG_ID_SEPARATOR)
//     }

//     public static func ==(lhs: ModulePath, rhs: ModulePath) -> Bool {
//         return lhs == rhs
//     }

//     public var hashValue: Int {
//         return description.hashValue
//     }
// }

// public struct LongId<T>:CustomStringConvertible, Hashable {
//     var id: Id<T>
//     var path: ModulePath

//     public init(_ id:Id<T>, declaredIn path:ModulePath) {
//         self.id = id
//         self.path = path
//     }

//     public init(_ idString:String, declaredIn path:ModulePath) {
//         self.init(Id<T>(idString), declaredIn:path)
//     }

//     public var description: String {
//         return path.description + ModulePath.LONG_ID_SEPARATOR + id.description
//     }

//     public static func ==(lhs: LongId<T>, rhs: LongId<T>) -> Bool {
//         return lhs.id == rhs.id && lhs.path == rhs.path
//     }

//     public var hashValue: Int {
//         return description.hashValue
//     }
// }

// // We want a bunch of things that behave like identifiers but are distinct types.
// // In particular, the various id's are used to as keys in their respective environments.
// public typealias ModuleId = Id<Module>
// public typealias TypeId = Id<TypeDef>
// public typealias ValId = Id<ValDef>

// // Any their fully qualified forms
// public typealias LongModuleId = LongId<Module>
// public typealias LongTypeId = LongId<TypeDef>
// public typealias LongValId = LongId<ValDef>

// // XXX probably not an Id
// // public typealias TyVar = Id<Ty.variable>
