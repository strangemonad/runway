
// Do we really have tycons in a dep-typed lang?
// Tycons are just constants at Type 
public typealias TypeContructor = Symbol
public typealias TypeVariable = Symbol
public typealias Constructor = Symbol
public typealias Counter = Int

public enum Ty {
    case constructed(tycon:TypeConstructor, args:[TypeDef])
    case record(types:[TypeDef])
    case variable(_:TypeVariable)
    // xxx others
}

// xxx levels
// rn to classifier?
public struct TypeDef {
    var ty:Ty
    var id:Counter
    // other stuff
}

// DatatypeDef describes a single, concrete, possibly recursive datatype.
public struct Datatype {
    var tycon : TypeConstructor
    var tyvars: [TypeVariable]
    var constructors: [Constructor: TypeDef?]
}
