
// Symbols are string-like things
struct Symbol: CustomStringConvertible, Equatable, Hashable {
  let name: String

  init(_ name: String) {
      self.name = name
  }

  var description: String {
      return name
  }
  
  public static func ==(lhs: Symbol, rhs: Symbol) -> Bool {
      return lhs.name == rhs.name
  }

  public var hashValue: Int {
      return name.hashValue
  }
}
