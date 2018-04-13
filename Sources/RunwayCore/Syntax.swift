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
