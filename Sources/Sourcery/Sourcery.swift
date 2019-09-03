
// Also investigate https://github.com/krzysztofzablocki/Sourcery


// Formater / buffer / formatable

// public protocol Language {}

// public protocol Java: Language {}


public protocol Formatable {
    // associatedtype Lang

    // XXX io / string buf?
    // XXX Result vs string
    func format() -> String;
}