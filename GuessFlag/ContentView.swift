// 

import SwiftUI
import SPAlert

struct ContentView: View {
  
  @State private var countries = ["爱沙尼亚", "法国", "德国", "爱尔兰", "意大利", "尼日利亚", "波兰", "俄罗斯", "西班牙", "英国", "美国", "摩纳哥"].shuffled()
  @State private var correctAnswerIndex = Int.random(in: 0...2)
  @State private var score = 0
  
  var body: some View {
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
          Text(countries[correctAnswerIndex])
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
            .padding()
        }
        Text("总分: \(score)")
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding()
          .background(BlurBackground(style: .systemUltraThinMaterial))
          .cornerRadius(20)
        Spacer()
        ForEach(0..<3) { index in
          Button(action: {
            self.didClickFlag(at: index)
          }) {
            Image(self.countries[index])
              .renderingMode(.original)
              .clipShape(Capsule())
              .overlay(Capsule().stroke(Color.black, lineWidth: 1))
              .shadow(color: .black, radius: 2)
          }
        }
        Spacer()
      }
    }
  }
  
  private func didClickFlag(at index: Int) {
    let scoreTitle: String
    let scoreMessage: String
    let isRight: Bool
    if index == correctAnswerIndex {
      scoreTitle = "正确"
      scoreMessage = "得分+1"
      score += 1
      isRight = true
    } else {
      scoreTitle = "错误"
      scoreMessage = "错误，得分-1\n这是\(countries[index])的国旗"
      score -= 1
      isRight = false
    }
    let alertView = SPAlertView(title: scoreTitle, message: scoreMessage, preset: isRight ? .done : .error)
    alertView.duration = 1
    alertView.haptic = isRight ? .success : .error
    alertView.present()
    countries.shuffle()
    correctAnswerIndex = Int.random(in: 0...2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
