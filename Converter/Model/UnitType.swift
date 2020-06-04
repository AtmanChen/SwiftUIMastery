// 

import Foundation

protocol UnitType {
  static var name: String { get }
  static var units: [NamedUnit] { get }
}

struct NamedUnit {
  let name: String
  let dimension: Dimension
}
