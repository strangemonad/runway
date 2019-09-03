import SourceryJava

public struct JavaTranslator {
    // XXX configuration
    // XXX environment?
    var lib: Syntax.Lib

    public init(lib: Syntax.Lib) {
        // XXX just hold on to the single lib for now
        self.lib = lib
    }

    // XXX need a greedy vs minimal version of translation
    // XXX translate and convert?

    public func translate(qualifiedId: String) -> FormatableJava {
        // XXX limit to top level lookups
        // XXX need language type marker protocol? 

        // XXX there are multiple valid options to build here
        // File, TopLevel, Class. need to control output.
        let spec = lookup(qid: qualifiedId)!
        switch spec {
        // case pattern:
            
        default:
            // XXX how to properly assert
            print("error: unknown type \(spec)")
        }


        return Class(
            name:"Instant",
            fields: [
                Field(type: TypeIdentifier("Long"), name: Identifier("millis")),
                Field(type: TypeIdentifier("Long"), name: Identifier("nanos"))
            ])
    }

    func lookup(qid: String) -> Syntax.Dec? {
        // XXX this should be in the environment

        // TODO actually match the name
        // XXX just taking the first declaration now

        return lib.declarations.first
    }
}




// type Result = result::Result<(), super::Error>;
// //type Result = result::Result<java::syntax::File, error::Error>;


// pub struct Translator {
//     lib: syntax::Lib,

//     _private: (),
// }

// impl Translator {
//     pub fn new(lib: syntax::Lib) -> Translator {
//         Translator { lib: lib, _private: () }
//     }

//     pub fn translate(&self, qid: &str) -> Result {
//         // XXX qualified ident vs str

//         // take the first top level and translate it

//         let dec = self.lib.top_level.0.first()?;
//         // XXX proper error
//         match dec {
//             syntax::Dec::Decl(decl) => unimplemented!(),
//             syntax::Dec::Dec(dec) => unimplemented!()
//         }

//         return Ok(());
//     }

// //    pub fn translate(&self: Translator, lib: syntax::Lib) -> Result {
// //        println!("Translatin... {:?}", lib)
// //    }
// }
