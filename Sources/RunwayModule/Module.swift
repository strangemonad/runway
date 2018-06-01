import RunwayCommon

// TODO, where do long Ids (sub-module paths) belong


//// rust
// For now
// Module := Spec | Morphism

//enum Module {
//    // Spec | Morphism
//}
//
//struct Spec {
//
//}
//
//struct SpecMorphism {
//
//}
////  /rust




// public enum Spec {
//     case data
//     case spec
// }

// public enum SpecMorphism {
//     case view
//     case realization
// }

/**
 * A module is either a named specification or a named morphism between specifications.
 *
 * More precisely, the category of Modules has specs as objects
 * and spec morphisms as arrows.
 *
 * A specification can be thought of as a theory (or signature).
 * A morphism can be thought of as a way of converting between specifications.
 *
 *  XXX abastract syntax grammar?
 *
 *  Module := Spec | SpecMorphism
 *  Spec   
 *  SpecMorphism := id : o -> o = 
 */
// public enum Module {
//     case spec(id:QualifiedModuleId, _:Spec)
//     case morphism(id:QualifiedModuleId, _:SpecMorphism)

//     public var id: QualifiedModuleId {
//         switch self {
//         case let .spec(id, _):
//             return id
//         case let .morphism(id, _):
//             return id
//         }
//     }
// }

// public typealias QualifiedModuleId = QualifiedId<Module>
