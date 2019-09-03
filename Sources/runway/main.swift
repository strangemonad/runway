
// - generate hard coded java /  output
// e.g. type point2d := (int, int)

import RunwayCore
import SourceryJava

let instant = Syntax.Decl(name: "Instant", ty: .data(Syntax.DataSig([
    Syntax.Decl(name: "millis", ty: .int)
    Syntax.Decl(name: "nanos", ty: .int)
    ])))

let acmeTime = Syntax.Lib(namespace: "acme.time", declarations: [
    .decl(instant)
    ])

// XXX Env, Reader

let env = Map

let javaTranaslator = JavaTranslator(lib: acmeTime)
let translated = javaTranaslator.translate(qualifiedId: "acme.time.Instant")

print(translated.format())


// let javaFile = SourceryJava.File(
//     package: "acme.time",
//     topLevel: .clazz(Class(
//         name:"Instant",
//         fields: [
//             Field(type: TypeIdentifier("Long"), name: Identifier("millis")),
//             Field(type: TypeIdentifier("Long"), name: Identifier("nanos"))
//         ])))

// print(javaFile.format())


    // let instant = syntax::Def {
    //     name: "Instant".to_owned(),
    //     ty: syntax::Ty::Data(syntax::DataSig {
    //         cons: vec![("millis".to_owned(), syntax::Ty::Int)]
    //     })
    // };

    // let acme_time = syntax::Lib {
    //     namespace: "acme.time".to_owned(),
    //     top_level: syntax::Sig(vec![
    //         syntax::Dec::Def(instant)
    //     ])
    // };

    // // java::Translator lib -> [Format-able] (start with [java::syntax::File])
    // let t = translators::java::Translator::new(acme_time);
    // let java = t.translate("acme.time.Instant").unwrap();

    // t.translate("acme.time.Instant");
    
    // println!("{:?}", java);
    
//    t.translate(acme_time);

    // this needs to be in a lib / module to start converting



// import RunwayCommon
// import RunwayModule
// import RunwayPackage

// The namespaces for some libraries we're "depending" on.
// let runwayTime = Namespace("runway", "time")
// let acmeBlog = Namespace("acme", "blog")
// let acmeCommon = Namespace("acme", "common")

// Some things we'll define
// let instant = QualifiedModuleId(ns:runwayTime, "Instant")
// let person = QualifiedModuleId(ns:acmeCommon, "Person")
// let post = QualifiedModuleId(ns:acmeBlog, "Post")

// let libRunwayTime = Library(definitions: [
//     Module.spec(id:instant, Spec.data)
// ])

// let libAcmeCommon = Library(definitions: [
//     Module.spec(id:person, Spec.data)
// ])

// let libAcmeBlog = Library(definitions: [
//     Module.spec(id:post, Spec.data)
// ])

// print(libRunwayTime)
// print(libAcmeCommon)
// print(libAcmeBlog)

// protocol SpecCompiler {
//     func compile(spec:Spec) throws
// }

// protocol Generator {
//     func translate<T>(fragment: T) throws -> String

//     // XXX should generate an abstract program structure instead of a string
//     // func compile() -> String
// }

// import SourceryJava

// enum TranslateError: Error {
//     case unknown
// }

// struct Java

// struct JavaGenerator: Generator {
//     // let program: TopLevel

//     static func translate<T>(fragment: T) throws -> String {
//         switch fragment {
//         case let ty as Ty:
//             return try translateTy(ty)
//         default:
//             print("can't translate", fragment)
//         }

//         return SourceryJava.Class(
//             name: "Foo",
//             fields: [
//                 ClassField(type: "long", name: "one"),
//                 ClassField(type: "long", name: "two")
//             ]
//         ).description
//     }

//     static func translateTy(_ ty:Ty) throws -> String {
//         switch ty {
//         case .int:
//             throw TranslateError.unknown
//         case .string:
//             throw TranslateError.unknown


//         case let .tuple(tys):
//             let fieldTypeId = "long" // XXX 
//             let fieldName = "one"
//             // let fields = tys.map({ClassField(type: fieldTypeId, name: fieldName)})
//             let fields = [
//                 ClassField(type: fieldTypeId, name: fieldName)
//             ]
//             return SourceryJava.Class(
//             name: "Tuple",
//             fields: fields
//             ).description
//         }
        
//     }
// }

// ... -> Core model
// Generator, Language specific emitter, 
// qual-id / symbol path, directed generation (not just top level)
// Probably want to start everything as a synthetic top-level module



// let Person = Datatype(
//     tycon:Symbol("Person"),
//     constructors:[Symbol("Person"): ]
// )

// TODO recursive
// let Nat = Datatype(
//     tycon:Symbol("Nat"), 
//     constructors:[
//         Symbol("z") : nil,
//         Symbol("succ") : 


// let b0 = Basis()
// b0.module.types[]

// // XXX symbols, identifier
// // XXX 

// let point2dType = Ty.tuple([.int, .int])
// let point3dType = Ty.tuple([.int, .int, .int])
// let matrix2Type = Ty.tuple([point2dType, point2dType])

// let sym = Symbol("A")

// let vid: ValId = ValId(string:"blah")
// let moid = ModuleId("blah")
// let moid2 = ModuleId("bloop")
// let moid3 = ModuleId("foop")

// let tc:TyCon = TyVar("list")
// let tv:TyVar = TyVar("alpha")

// print(moid.blah())
// let lvid = LongValId(["foo"], ValId("blah"))
// let vid1 = LongValId()
// let lvid2 = LongValId("bar", declaredIn:ModulePath(moid, moid2))
// print(lvid2)
// print(lvid == lvid2)
// let vid = try Id("foo")
// print(vid == moid)

// let top = ModuleEnv()

//let dec


// let topMod = TopLevel(["point2d"])
// let ex = Ty.tuple([.int, .int])
// let translated = try JavaGenerator.translate(fragment: ex)
// print(translated)

// print(sym)

// print("point2d: ", point2dType)
// print("point3d: ", point3dType)
// print("matrix2: ", matrix2Type)
