# runway
Domain models and their values



# Language / type system Ideas

- Refinements types?

- separation of Adequecy 

- Signature morphisms

- Programer defined Index Domains http://dlicata.web.wesleyan.edu/pubs/lh05concert-talk/lh05concert-talk.pdf

- 2 levels (representation vs computation)?
    - Del-Calculus / Delphin
    - Alternative (rather than embedding) is to allow the LF / Lam_pi types
    to have an interpretation in some target
        - weak form is 1 direction, interpret: lf -> target_representation
        - strong form is showing adequacy of the interpretation
        - similar to how twelf gives LF a semantic interpretation to allow logic programing

- need for a modal logic?

- representation invariants

- Adequacy of representation via logical relations (to a correct impl)
    - do we still have parametricity (naturality) in a non-polymorphic setting

- See views feature request of succML
    (B.20) https://people.mpi-sws.org/~rossberg/hamlet/hamlet-succ-1.3.1S5.pdf
    i.e.: 

- Static meta programming
    - https://www.cs.bu.edu/~hwxi/academic/papers/icfp03.pdf
    - Typeful program transformation https://www.cs.bu.edu/~hwxi/academic/papers/FIitpt.pdf

- Programming & thm proving https://www.cs.bu.edu/~hwxi/academic/papers/icfp05.pdf

- Set types (from nuprl)
    - see Crary PhD 3.3
    - also see constraint domains in Pfenning / Xi DML

# Open questions:

- LF works because you're representing a logic or language in its totality
    - does this work in general for an open ended concept space (where all that we have)
    is a Signature (sequence of prior concepts we can depend on)
    - what do we loose if anything?

- Does twelf style goal directed search + unification (asusming term reconstruction) drive
    target language interpretation?
    e.g. are we just searching for a target type / target type converter given a type?
        - e.g.
        JavaType <t:Type> : Type
        JavaLong : JavaType<Int>

        toJavaRep: (t:Type) -> JavaType(t)
        toJavaRep(Int) = JavaLong
        javaLong: (i:Int) -> JavaLong
        but we need to capture the value?

    - We might get multiple solutions but maybe that's ok?
        - that's where we order by heuristics, pick first or allow config
        - config and heuritics are just pre-supposed constraints
    - What of values to emit?


- Can definition `n = 4` just be made `n : \[].4` or `n : (\[x].x)(4)`
- do we allow single element tuples (rather than bare values)?

# Implementation ideas
Encode target language features as types / functors
https://brianmckenna.org/blog/polymorphic_programming

- Let path'ed identifiers have a "module part" and a "decl part"
    - e.g. in some module ...math
    Nat = sig {
        z : Nat
        suc : (Nat) -> Nat
    }
    -> ...math.Nat : Type
    -> ...math.Nat.z : z
    - i.e.: the signature and namespacing interop to allow the internal / external environment view of the world.
    - i.e.: the *IS* a type called Nat, we can ignore its internal structure
    - but it also has the internal structure z | succ
    => Types have an "atomic" view (TyCon) and a "modular" view (internal structure)

- Internal types (LF / Lam_pi types) have a target representation 
    - we can create an inductive definition of the mapping
        - e.g Int = (JavaInt = Target<Java, Int>)
    - Target types are those we know how to emmit a representation for
    - do we choose the largest or smallest types? (ie: most general or most specific?)
- Related problem, when to treat a type as atomic / ground vs when to peer into
    its def.
    - eg: 
        Nat: Type = {z, s(n)}
        Ord, Eq...
        Bounded <...> : Type
        Int32 = Bounded<Nat, min, max>
        Int64 = Bounded<Nat, min, max>
        Int = Int64 // convenience

    - Sometimes we just care that Int can be represented by an int 64
    - Sometimes we want to prove things about the underlying Nat structure, up to 
        the bounds "type refinement"
    - How does the subtyping relationship work here? Int *is a* Nat
        - treat Int and Nat as overlapping types where Nat is the largest type and unify?
            - somehow get to the invariant / meta-statement that "all i:Int are Nat"
            - that's just `\x:Int -> Nat` ie an LF lam-term
            - you can't always assume that it't always fully contained
                e.g. datatype Foo = Age of Nat | Name of String
        - Prior work on subtyping http://lambda-the-ultimate.org/node/4511
            - Aspinall, subtyping dep types and also singleton types
        - How does this play with unicity ie: M:A   M:A'  |- A equiv A'
        - Should this be done as behavioural subtyping (maybe / probably)
         or is there a syntactic definition?
- How do I choose value representations
    - just use an adequacy bijection?
- Would be cool to allow modules to gradually open up
    - maybe I just care about "programming" an int64 is an int64
    - maybe I care to verify deeper properties e.g: "import module ring"
    and suddenly an Int can be treated with properties of rings / fields
    eg: by default we have 
    Nat : Type // it's a type but we have no details
    Bounded ...
    Int32 = 
    Int64 = 
    Int = Int64
    
    - we somehow allow numerals to be intrinsic constructors of Int
        - e.g. assume predefined internal 1:Int, 2:Int, 3:Int ...
        - Larger numbers automatic eg must be that [Max_Int32 + 1] : Int64
        - To get smaller, must be explicit `n : Int32 = 2` or `n = 2 : Int32`?
    - What are the search constraints to guide goals that Int is a valid "ground"
        - ie. search control and goals

# Language

A language for expressing and communicating ideas but not
how to define the processes behind them.

## Primitives / builtin

Note: separation of primitive types vs primitive vals
    - if we allow expressing a value => we can express its type
    - but we might have some types that we can't express values for (e.g. `->` )
- Symbols?
- Tuples (generalized as records)
- finite maps? 
    - want to allow defining bi-jections (e.g. toDbRecord fromDbRecord)
    - can records suffice? Does that mean we need to expose the set of symbols used as indicies?
    - do we reconcile tuples with `Vec<T:Type, size:Int>`?
- Strings (full unicode?)
- numbers (int, float, how to handle representation choice?)
- lists?
    - and is that primitive?

- types
    - probably a dependent type system under the hood?
    - maybe expose dependent types in the language?
- values (constants)
- everything is in normal form (there's no dynamics)
- modules

- Allow alias defs via `:=` ie what twelf calls `%abbrev`. ie: sbustitute immediately

- How to deal with recursive types / data types (ie abstract types) / modules / frozen inductive definitions
    - e.g. freezing nat = z | s n prevents defining plus: (nat, nat) -> nat
    - do we want to distinguish constructors from operations? We want to separate the structural 
    inductive definition (that we can induce over) from the rest (also see agda modules and agda abstract)
    - http://agda.readthedocs.io/en/v2.5.3/language/data-types.html
    - probably strictly positive
- Are the primitive tuples dependent?
    - how does that work with named args?

# Syntax "pronounciation" guide

Here's a few snippets of runway code and how to informally read it (in our heads or aloud).
We often want to know how to "pronounce" phrases without getting bogged down in the technicalities
of the actual math and type theory.

We'll leave pointers about the underlying terminology so the curious know where to look.


## Stating things we know

The main idea is that we want to simply stating things we know (or might want to know).
We get the computer fill in any gaps or point out inconsistencies.

Asside: Statements about things we know are called judgments.

We have 2 very basic kinds of statements that express 2 primitive relationships
- Definition eg: his name is James
- Classification eg: she is a CEO.


When you see `=` think "is".
Left to right: "is equal to", "is defined to be", "is identical to", "is the same as", "is identified with", "is solved by"
Right to left: "is the definition of", "is the solution to", "can stand for", "can be substituted for"

`n = 5`
- Left to right: `n` is `5` (an `Int`)
- Right to left: the `5` can stand for `n` (whenever I see `n` from now on)*

`name = "James"`
- Left to right: `name` is `"James"` (a `String`)
- Right to left: `"James"` can stand for `name` (whenever I see `name` from now on)*

It's tempting to think we're just assigning values to constants but its more useful
to think of identification as a solution to an equation like you might remember
from high-shool math (e.g. x = 4y + 5). You're stating a relationship about the left and right
hand sides of the equation. In the simple cases above the solution is trivial assignment.


When you see `:` think "is a"
Left to right: "is a member of", "is an element of"
Rgith to left: xxx

`n : Int`
- Left to right: `n` is an `Int`
- Right to left: any value of `Int` (`1`, `2`, `3`...) can be assigned to `n` (but nothing else)
- Right to left: `Int` classifies `n`
- Valid solutions to `n` must come from the domain of values defined by `Int`


# Random syntax thoughts

- tuples are primitive
- are tagged tuples primitive? What's the syntax?
    - e.g. if `Sym (some, tuple)` how is this not fn app?
    - could do `Sym of (some, tuple)` `Sym with (some, tuple)`
    - constructor calls look like `Sym(s,t)` where `S: (some, tuple) -> T`
    - underlying data is actually `('Sym, (s, t)) : T`
    - Thinking of T as the tagged union...
        `T = ('c1, (a, b, c)) | ('c2, (d, e))`
        i.e. a union type that's made disjoint because `T.fst` is `c1` or `c2`
        the value of c1 / c2 can be anything, the name of the ctor or the
        actual function eg `c1 : (A, B, C) -> T` and `c2 : (D, E) -> T`
        `T = ('c1, (A, B, C)) | ('c2, (D, E))`
            - actually want, `c1 <r:Type> : r -> T<'c1, r>`?
            - maybe more like `CTor <name:String, repr:Type, res:String -> Type -> Type> : r -> res<name, r>`
            - or don't bother modeling it in depdendency and just compute the closed form
            - `T.Tag : Type`; 

- Review regular sum types, how would this work in dep-type land?
    - Is a disjoint union just a dependent pair?


- Regular fun
    `A -> B`, `(A, B, C) -> D`
- Dep fun
    `(a:A) => B(a)`, `(a:A, B, C) => D(a)`
- Regular tuple
    `(a, b) : (A, B)` (and all the other fun keyword stuff from swift)
- Dep pair?
    `(a, mkB(a)) : (a:A; B(a))` semicolon in the type, do we care about it in the literal?
    - or just not care e.g. a dep pair `(A, B(x=a))` can always be the result of a dep-fn

<!-- type Foo : (int, int) -->
Foo = (Int, Int)

Foo : Type
 - 


On the fly tags (assuming Foo enumerated data type)?
How does twelf's nat work under the hood?

- See delphin for signature scopes

want something like:

Nat : Type
z : Nat
s : Nat -> Nat
%freeze (the structural inductive type definition but not other uses of nat)

Nat : Type = {
    z : Nat
    s : Nat -> Nat
}

What about 
Nat = {z, s: Nat -> Nat}
Nat : Type = {z, s: Nat -> Nat}
Nat = {z: Nat, s: Nat -> Nat}
Nat = {z, s(n:Nat)}
Nat = {z, s <n:Nat> }
Nat = {z, s <n:Nat> : Nat }
Nat = {z : Nat , s <n:Nat> : Nat }
Nat : Type = {
    z : Nat
    s <n:Nat> : Nat
}

eg: Bool = {True, False}
Bool = {True. False.}

Foo_Tag : Type
c1:Foo_Tag
c2:Foo_Tag
%freeze

// Most direct
Foo_Tag : Type = {
    c1:Foo_Tag
    c2:Foo_Tag
}


// ?
Foo_Tag = {
    c1:Foo_Tag
    c2:Foo_Tag
} : Type
// ?

Foo_Tag : Type = {c1, c2}
Foo_Tag = {c1, c2} : Type
Foo_Tag:Type = c1 | c2


// type alias is not what we want
Person = (name:String, age:Int)

Person = {
    name: String
    age: Int
}

// ^^^ incompatible with vvv 
// ie: the `Foo : Type = sig` form
Foo = {
    Foob: (i:Int) -> Foo
    Fab: (s:String, i:Int) -> Foo
}

Non-disjoint sum is common - should it be streamlined?

Person = {
    new : (name:String, age:Int) -> Person
}

p = Person.new(....) // vs p = Person(...)

Tedious to always 
1) choose a name for the constructor
2) Specify the return type
3) the call site name isn't what we want for the definition site
    // alternatives new, of, from, with, as, init, get

- introduce a `constructor` keyword like idris?
- alternation is no longer as obvious in this format, does this matter?

do we want an alternate form?

Person = data {
    | _ of (name:String, age:Int)
}

Bool = {
    true: bool
    false: bool
}

Bool = data {
    | true
    | false
}

or also allow a one liner `Bool = data {true | false}` or just `Bool = data true | false`

MaybeInt = {
    none: MaybeInt
    some: Int -> MaybeInt
}

MaybeInt = data {
    | none
    | some(Int)
}



// Does the above allow proper induction?
// The above feels too nuts and bolts, I don't really care about a tuple of value constructors
// It also looses the idea of a tagged tuple

Foo = {
    | Foob (i:Int)
    | Floop (i:Int)
    | Fab (s:String, i:Int)
}


// Does the following allow any form of data abstraction?
Foo = Foob (i:Int)
    | Fab (s:String, i:Int)


Foo = data
    | Foob (i:Int)
    | Fab (s:String, i:Int)

Foo =
    | Foob (i:Int)
    | Fab (s:String, i:Int)



Elaborates to =>
Option 1)
Person: Type
Person.new: (name:String, age:Int) -> Person

Option 2)


Questions about data types
- Are they modules?
- Namespace and name of the type name / tycon vs value constructors / tags
    1) it's the the defined name e.g. Person = data... => Person:Type
    2) Person is a tuple / module and it's inside Person = data... => Person.T:Type
        where `Person: (T:Type, new:(name:String, age:Int) -> T)`
    - want to be able to say `p1 : Person` and have it mean `Person.T` (not the tuple)
    - want to be able to say `p1 = Person(name = "Shawn", age = 34)` rather than `p1 = Person.new(...)`


## "Hypothetical" type judgements

Best shown by example:

    ```
    List <elem:Type> : Type
    > List : (elem:Type) -> Type

    List(String)
    > List(String) : Type

    StringList = List(String)
    > StringList : ??? List(String)

    l : StringList
    > l : List(String)
    ```

Pattern:

`Foo <t:Type> : Type`

Read typically:
- Foo is a family of types indexed by a Type t
- Foo is a function that when applied to a Type t returns a Type, Foo(t)

Read logically:
- Foo is a Type, assuming 't' is a Type
- Given a Type t, Foo(t) is a Type without any assumptions
- Foo is a judgement ranging over any Type
- Foo is the idea that for all t: Type there exists a Type (xxx reword)


Elaborates to:
    => `Foo : (t:Type) -> Type`
    => `Foo(String) : Type`

Note: Foo is a type constructor (in the sense that it's a function Type -> Type)
Just move the `:` for the curried vs un-curried form.

Note: Functions capture the concept of hypothetical



More examples
`List <elem:Type> : Type`
    => `List : (elem:Type) -> Type`
`Vec <elem:Type, count:Int> : Type` => `e
 
 Reads Foo 

// Tuple is a kind family
Tuple0: () -> Type
Tuple1: Type -> Type
Tuple2: Type -> Type -> Type

// Foo:Tuple<Type, Type>

tuple: [Type -> Type


type Foo = (int, int)
Foo = (int, int)
> Foo : (Type, Type) = (Int, Int)
// do we also also have a TyCon Foo:Int -> Int -> Type

(1,2):Foo
(1,2):(int, int)

bar = 5
> bar = 5 : Int

// ie: bar : Int and 5 :
// ie =<Int> where `= <t:Type> : (t, t) -> Bool`

Person = (name: String)
> Person : Type = (name : String)
> did I introduce a tyocon in the equation above? Person(name = foo)?

Maybe: <Elem> -> Type
type Maybe<Elem>

Maybe = data <Elem> {
    | None
    | Some Elem
}
> Mabye : Type -> Type
> None : Maybe
> Some


