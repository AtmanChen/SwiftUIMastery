// 

import Foundation

struct Length: UnitType {
  static let name = "长度"
  static var units: [NamedUnit] = [Length.meters, Length.kilometers, Length.feet, Length.yards, Length.miles]
  
  private static let meters = NamedUnit(name: "米", dimension: UnitLength.meters)
  private static let kilometers = NamedUnit(name: "千米", dimension: UnitLength.kilometers)
  private static let feet = NamedUnit(name: "英尺", dimension: UnitLength.feet)
  private static let yards = NamedUnit(name: "码", dimension: UnitLength.yards)
  private static let miles = NamedUnit(name: "英里", dimension: UnitLength.miles)
}
