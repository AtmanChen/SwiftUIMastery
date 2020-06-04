// 

import Foundation

struct Time: UnitType {
  static let name = "时间"
  static let units: [NamedUnit] = [Time.seconds, Time.minutes, Time.hours]
  
  private static let seconds = NamedUnit(name: "秒", dimension: UnitDuration.seconds)
  private static let minutes = NamedUnit(name: "分", dimension: UnitDuration.minutes)
  private static let hours = NamedUnit(name: "时", dimension: UnitDuration.hours)
}
