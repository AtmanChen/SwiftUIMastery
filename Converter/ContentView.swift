// 

import SwiftUI

struct ContentView: View {
  
  @State var unitTypeIndex: Int = 0 // 大类 index
  @State var unitTypeUnitsIndex: Int = 0 // 小类第一行 index
  @State var convertedUnitTypeUnitsIndex: Int = 0 // 小类第二行 index
  @State var inputValue: String = "" // 输入
  
  var convertedValue: String {
    let input = Measurement(value: Double(inputValue) ?? 0, unit: currentUnitTypeUnitsUnit.dimension)
    let result = input.converted(to: currentUnitTypeConvertedUnitsUnit.dimension).value
    return "\(result)"
  }
  
  // 当前选中大类
  var currentUnitType: UnitType.Type {
    UnitTypes.types[unitTypeIndex]
  }
  
  // 当前选中大类 Units
  var currentUnitTypeUnits: [NamedUnit] {
    currentUnitType.units
  }
  
  // 当前第一行选中小类
  var currentUnitTypeUnitsUnit: NamedUnit {
    if unitTypeUnitsIndex >= currentUnitTypeUnits.count {
      return currentUnitTypeUnits.first!
    }
    return currentUnitTypeUnits[unitTypeUnitsIndex]
  }
  
  // 当前第二行选中小类
  var currentUnitTypeConvertedUnitsUnit: NamedUnit {
    if convertedUnitTypeUnitsIndex >= currentUnitTypeUnits.count {
      return currentUnitTypeUnits.first!
    }
    return currentUnitTypeUnits[convertedUnitTypeUnitsIndex]
  }
  
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          Picker("", selection: $unitTypeIndex) {
            ForEach(0..<UnitTypes.types.count) { index in
              Text(UnitTypes.types[index].name)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section {
          HStack {
            TextField("请在这里输入", text: $inputValue)
            Text(currentUnitTypeUnitsUnit.name)
          }
          Picker("", selection: $unitTypeUnitsIndex) {
            ForEach(0..<self.currentUnitType.units.count, id: \.self) { index in
              Text(self.currentUnitType.units[index].name)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(
          header: HStack {
            Spacer()
            Image(systemName: "arrow.up.arrow.down.circle.fill")
              .font(.largeTitle)
              .padding()
            Spacer()
          }
          ) {
          HStack {
            Text(convertedValue)
            Spacer()
            Text(currentUnitTypeConvertedUnitsUnit.name)
          }
          Picker("", selection: $convertedUnitTypeUnitsIndex) {
            ForEach(0..<self.currentUnitType.units.count, id: \.self) { index in
              Text(self.currentUnitType.units[index].name)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
      }
      .navigationBarTitle("Converter")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
