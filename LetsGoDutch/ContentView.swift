// 

import SwiftUI

struct ContentView: View {
  
  @State private var totalCost: String = ""
  @State private var totalPersonCount: Int = 1
  @State private var tipsPercent: Int = 0
  
  private let tipsPercents = [0, 15, 20, 25]
  
  private var grandTotal: Double {
    let cost = Double(totalCost) ?? 0
    let tip = Double(tipsPercent) / 100 * cost
    return cost + tip
  }
  
  private var costPerPerson: Double {
    grandTotal / Double(totalPersonCount)
  }
  
  var body: some View {
    NavigationView {
      Form {
        HStack {
          Text("总金额")
            .frame(minWidth: 120, alignment: .leading)
          Spacer()
          TextField("输入金额", text: $totalCost, onEditingChanged: { _ in }, onCommit: {})
            .keyboardType(.decimalPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
          Text("元")
        }
        HStack {
          Text("人数")
            .frame(minWidth: 120, alignment: .leading)
          Spacer()
          HStack(spacing: 5) {
            TextField("输入人数", value: $totalPersonCount, formatter: NumberFormatter())
              .keyboardType(.numbersAndPunctuation)
              .textFieldStyle(RoundedBorderTextFieldStyle())
            Stepper("", value: $totalPersonCount, in: 1...1000).labelsHidden()
          }
        }
        
        Section(header: Text("小费")) {
          Picker("", selection: $tipsPercent) {
            ForEach(self.tipsPercents, id: \.self) { percent in
              Text("\(percent)%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        Section(header: Text("人均")) {
          Group {
            Text("$")
              .font(.footnote)
            +
            Text("\(costPerPerson, specifier: "%.2f")")
              .font(.title)
          }
        }
      }
      .gesture(
        DragGesture()
          .onChanged { _ in self.endEditing() }
      )
      .navigationBarTitle("AA 收款")
    }
  }
  
  private func endEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
