// 

import SwiftUI
import ComposableArchitecture
import SPAlert

struct GuessFlagState: Equatable {
  var countries = ["爱沙尼亚", "法国", "德国", "爱尔兰", "意大利", "尼日利亚", "波兰", "俄罗斯", "西班牙", "英国", "美国", "摩纳哥"]
  var correctAnswerIndex: Int = 0
  var score = 0
}

enum GuessFlagAction: Equatable {
  case `init`
  case guess(Int)
}

struct GuessFlagEnvironment {}

let guessFlagReducer = Reducer<GuessFlagState, GuessFlagAction, GuessFlagEnvironment> { state, action, _ in
  switch action {
  case .`init`:
    state.countries = state.countries.shuffled()
    state.correctAnswerIndex = Int.random(in: 0...2)
    return .none
  case let .guess(index):
    let guessResult = index == state.correctAnswerIndex
    let scoreTitle = guessResult ? "正确" : "错误"
    let scoreMessage = guessResult ? "得分+1" : "错误，得分-1\n这是\(state.countries[index])的国旗"
    state.score = guessResult ? state.score + 1 : state.score - 1
    let alertView = SPAlertView(title: scoreTitle, message: scoreMessage, preset: guessResult ? .done : .error)
    alertView.duration = 1
    alertView.haptic = guessResult ? .success : .error
    alertView.present()
    return Effect(value: .`init`)
  }
}

struct GuessFlag: View {
  let store: Store<GuessFlagState, GuessFlagAction>
  var body: some View {
    WithViewStore(self.store) { viewStore in
      ZStack {
        LinearGradient(
          gradient: Gradient(colors: [.blue, .black]),
          startPoint: .top,
          endPoint: .bottom)
          .edgesIgnoringSafeArea(.all)
        VStack(spacing: 30) {
          VStack {
            Text("猜猜哪个国旗是")
              .fontWeight(.semibold)
              .foregroundColor(.white)
              .padding()
            Text(viewStore.countries[viewStore.correctAnswerIndex])
              .foregroundColor(.white)
              .font(.largeTitle)
              .fontWeight(.black)
              .padding()
          }
          Text("总分: \(viewStore.score)")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(BlurBackground(style: .systemUltraThinMaterial))
            .cornerRadius(20)
          Spacer()
          ForEach(0..<3) { index in
            Button(
              action: {
                viewStore.send(.guess(index))
            }
            ) {
              Image(viewStore.countries[index])
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 2)
            }
          }
          Spacer()
        }
      }
    }.navigationBarTitle("Guess Flag")
  }
}
