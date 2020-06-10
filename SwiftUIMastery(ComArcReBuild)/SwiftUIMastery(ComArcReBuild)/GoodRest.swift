// 

import SwiftUI
import ComposableArchitecture

struct GoodRestState: Equatable {
  var getUpDate: Date = Date.defaultWakeUpTime
  var sleepAmount: Double = 4.0
  var bestSleepTime: String = ""
}

enum GoodRestAction: Equatable {
  case setGetUpDate(Date)
  case setSleepAmount(Double)
  case calculateBestSleepTime
}

struct GoodRestEnvironment {}

let goodRestReducer = Reducer<GoodRestState, GoodRestAction, GoodRestEnvironment> { state, action, _ in
  switch action {
  case let .setGetUpDate(date):
    state.getUpDate = date
    return Effect(value: .calculateBestSleepTime)
  case let .setSleepAmount(sleepDuration):
    state.sleepAmount = sleepDuration
    return Effect(value: .calculateBestSleepTime)
  case .calculateBestSleepTime:
    let sleepDuration = state.sleepAmount * 60.0 * 60.0
    let sleepTime = state.getUpDate - sleepDuration
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    state.bestSleepTime = dateFormatter.string(from: sleepTime)
    return .none
  }
}

struct GoodRest: View {
  let store = Store<GoodRestState, GoodRestAction>(
    initialState: GoodRestState(),
    reducer: goodRestReducer,
    environment: GoodRestEnvironment())
  var body: some View {
    WithViewStore(self.store) { viewStore in
      Form {
        Section(
          header: Text("你想什么时候起床?").font(.headline)
        ) {
          DatePicker("", selection: viewStore.binding(get: \.getUpDate, send: GoodRestAction.setGetUpDate), displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
        }
        Section(
          header: Text("你想睡多久?").font(.headline)
        ) {
          Stepper(value: viewStore.binding(get: \.sleepAmount, send: GoodRestAction.setSleepAmount), in: 4...12, step: 0.25) {
            Text("\(viewStore.sleepAmount, specifier: "%g")")
          }
        }
        Section(
          header: Text("推荐就寝时间").font(.headline)
        ) {
          Text(viewStore.bestSleepTime)
            .font(.title)
        }
      }
      .navigationBarTitle("Good Rest")
    }
  }
}

struct GoodRest_Previews: PreviewProvider {
  static var previews: some View {
    GoodRest()
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

