// 

import Foundation

struct Temperature: UnitType {
  static let name = "温度"
  static let units: [NamedUnit] = [Temperature.celsius, Temperature.farenheit, Temperature.kelvin]
  
  private static let celsius = NamedUnit(name: "摄氏度", dimension: UnitTemperature.celsius)
  private static let farenheit = NamedUnit(name: "华氏度", dimension: UnitTemperature.fahrenheit)
  private static let kelvin = NamedUnit(name: "开尔文", dimension: UnitTemperature.kelvin)
}
