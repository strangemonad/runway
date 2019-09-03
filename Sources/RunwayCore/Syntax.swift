
public struct Syntax {
    fileprivate init() {}


    /// Package syntax

    public struct Lib {
        var namespace: String
        var declarations: Spec

        public init(namespace: String, declarations: Spec) {
            self.namespace = namespace
            self.declarations = declarations
        }
    }


    /// Module syntax
    // XXX sig spec vs spec morphism
    // XXX naming. / module level stuff

    public typealias Spec = [Dec]

    public enum Dec {
        case decl(_: Decl)
        case def(_: Def)
    }


    /// Core syntax

    // c:T
    public struct Decl {
        var name : String
        var ty: Ty

        public init(name: String, ty: Ty) {
            self.name = name
            self.ty = ty
        }
    }

    // c = T of c:T = o
    public struct Def {
        var name: String
        var ty: Ty
        // XXX defined constant

        public init(name: String, ty: Ty) {
            self.name = name
            self.ty = ty
        }
    }

    public enum Ty {
        case int
        case data(_: DataSig)
    }

    // The body of a data type (for now) is identical to it's constructors – 
    // an array of c:T declarations.
    //
    // Does allowing Ty (istead of a tyvar or something similar) open us 
    // up to too much recursion?
    public typealias DataSig = [Decl]

    // public struct DataSig {
    //     // (constructor, rho:Ty) pairs
    //     var constructors: [(name: String, rho: Ty)]

    //     public init(constructors: [(name: String, rho: Ty)]) {
    //         self.constructors = constructors
    //     }

    // }
}


// struct Syntax {
//     private init() { }

//     public enum Ty: CustomStringConvertible {
//         case int
//         case string

//         // case variable(String)
//         case tuple([Ty])
        

//         // xxx record - a tuple of fields (symbol, Ty pairs)
//         // xxx list
//         // xxx sum / datatype

//         // xxx modules / signatures functors?

//         public var description: String {
//             switch self {
//             case .int:
//                 return "int"
//             case .string:
//                 return "string"

//             // case let .variable(t):
//             //     return t
//             case let .tuple(tys):
//                 let tyDescriptions: String = tys.map({$0.description}).joined(separator: ", ")
//                 return "(\(tyDescriptions))"
//             }
//         }
//     }    
// }




// Runway internal syntax

// package / lib / namespace?
// decl / def

// Instant = data {
//   millis: Int
// }
//
// Instant = data {
//   | Instant(millis:Int)
// }
//
// Instant = {
//   to_instant: (millis:Int) -> Instant
//   from_instant: Instant -> (millis:Int)
// }
//

// #[derive(Debug)]
// pub struct Lib {
//     // XXX this needs some rework

//     pub namespace: String,
//     pub top_level: Sig,
// }

// #[derive(Debug)]
// pub struct Sig(pub Vec<Dec>);

// #[derive(Debug)]
// pub enum Dec {
//     Decl(Decl),
//     Def(Def)
// }

// // Core syntax

// /// c:T
// #[derive(Debug)]
// pub struct Decl {
//     pub name: String,
//     pub ty: Ty,
// }

// /// c = T or c:T = o
// #[derive(Debug)]
// pub struct Def {
//     pub name: String,
//     pub ty: Ty,
// }

// #[derive(Debug)]
// pub enum Ty {
//     // XXX hard coded (is this a tyvar?)
//     Int,
//     // XXX tuple
//     Data(DataSig),
// }

// #[derive(Debug)]
// pub struct DataSig {
//     // xxx track instantiation / type uniqueness?

//     // (constructor, rho:Ty) pairs
//     pub cons: Vec<(String, Ty)>,
// }

