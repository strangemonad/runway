
// Also investigate https://github.com/krzysztofzablocki/Sourcery


// Formater / buffer / formatable

public protocol Formatable {
    // XXX io / string buf?
    // XXX Result vs string
    func format() -> String;
}