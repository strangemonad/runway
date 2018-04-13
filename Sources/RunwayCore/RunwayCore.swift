// type (int, int) is TyCon(prod, [int, int])?


// public struct TypeFunc {

// }

// // What SML calls a TyStr (Figure 10)
// public struct TypeDef {
//     var typeFunc: TypeFunc
//     var vals:ValEnv
// }

// What SML calls a ValStr
// public protocol ValDef {
//     // Type scheme and sesolution status
// }

/**
 * xxx naming
 */
// public protocol Module {
//     var subModules: ModuleEnv {get}
//     var types: TypeEnv {get}
//     var vals: ValEnv {get}
// }


public enum Declaration {

}

// TODO(shawn) separate concept of a tycon / ty from the built-in types


// xxx naming / generic env etc
// public struct TopLevel {
//     // xxx bogus
//     var typeDecls: [Symbol: Ty]
// }


// Runway analog to a Program
// Actually should be Spec = Decl, Optional<Spec>
// I.e. a Spec is a co-inductive type (like a stream of declarations)
public protocol Spec {
    var decls:[Decl]

    static func process(topLevelDelaration topDecl:Decl assuming basis:Basis) -> Basis

    // func interpret?

    // spec is a sequence of top-level decs
    // assuming a basis, given a spec you get a modified basis
    //  B |- spec => B
}

