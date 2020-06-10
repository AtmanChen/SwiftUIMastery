// 

import SwiftUI

struct ContentView: View {
  @State var getUpDate = Date.defaultWakeUpTime
  @State var sleepAmount: Double = 4.0
  var bestSleepTime: String {
    let sleepDuration = sleepAmount * 60.0 * 60.0
    let sleepTime = getUpDate - sleepDuration
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    return dateFormatter.string(from: sleepTime)
  }
  var body: some View {
    NavigationView {
      Form {
        Section(
          header: Text("你想什么时候起床?").font(.headline)
        ) {
          DatePicker("", selection: $getUpDate, displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
        }
        Section(
          header: Text("你想睡多久?").font(.headline)
        ) {
          Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier: "%g")")
          }
        }
        Section(
          header: Text("推荐就寝时间").font(.headline)
        ) {
          Text(bestSleepTime)
            .font(.title)
        }
      }
      .navigationBarTitle("Good Rest")
    }
  }
}

extension Date {
  static var defaultWakeUpTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 26
    return Calendar.current.date(from: components) ?? Date()
  }
}
