IntTree = data {
    empty : IntTree
    tree : (IntTree, IntTree) -> IntTree
}




Person = data {
    name : String
    ...
}

Person = data {
    Person: (name:String, ...)
}


Person = {
    /tuple-expr/
}

What is `Person`
1) `Person : Type` ie type constructor that's constant
    ie the existential type Person : Type = Some(t,tau) but there's no t in tau?
2) There needs to be a ctor Person.new : (name:String, ...) -> Person
    s.t. p = Person.new(name = "Shawn", ...) : Person
    p.name vs 

Person = data (name:String, ...)