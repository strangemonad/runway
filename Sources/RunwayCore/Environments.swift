

// module env, type env, value env
// public typealias ModuleEnv = Dictionary<ModuleId, Module>
// public typealias TypeEnv = Dictionary<TypeId, TypeDef>
// public typealias ValEnv = Dictionary<ValId, ValDef>


// // XXX(shawn) probably some cleanup where 
// // Env is a protocol adopted by module?
// // ie. what's a module if not just an Env

// public struct Env: Module {
//     public var subModules: ModuleEnv
//     public var types: TypeEnv
//     public var vals: ValEnv

//     public init() {
//         self.subModules = ModuleEnv()
//         self.types = TypeEnv()
//         self.vals = ValEnv()
//     }
// }

// public struct Basis {
//     // XXX missing TyNameSet * FunEnv * SigEnv
//     public var module: Module

//     public init() {
//         module = Env()
//     }
// }