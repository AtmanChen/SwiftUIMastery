// 

import Foundation
import Combine
import SwiftUI

enum GameMode: CustomStringConvertible, Equatable {
  case unlimit
  case timeLimit(countDown: Int)
  
  var description: String {
    switch self {
    case .unlimit:
      return "无限模式"
    case let .timeLimit(countDown):
      return "计时模式，还剩 (\(countDown)) 秒"
    }
  }
  
  func toggleMode() -> GameMode {
    if self == .unlimit {
      return .timeLimit(countDown: 5)
    }
    return .unlimit
  }
  
  func resetTime(countDown: Int) -> GameMode {
    .timeLimit(countDown: countDown)
  }
  
  static func ==(lhs: GameMode, rhs: GameMode) -> Bool {
    switch (lhs, rhs) {
    case (.unlimit, .unlimit):
      return true
    case (let .timeLimit(count1), let .timeLimit(count2)):
      return count1 == count2
    default:
      return false
    }
  }
}

enum GameStrategy: String, CaseIterable, Equatable {
  case toWin = "直接赢下"
  case toLose = "故意输掉"
  
  var backgroundColor: Color {
    switch self {
    case .toWin:
      return .green
    case .toLose:
      return .red
    }
  }
  
  func toggle() -> GameStrategy {
    if self == .toWin {
      return .toLose
    }
    return .toWin
  }
}

enum Gesture: CaseIterable {
  case rock
  case paper
  case scissors
}

struct GestureView: View {
  var gesture: Gesture
  var body: some View {
    switch gesture {
    case .rock: return Text("✊")
    case .paper: return Text("✋")
    case .scissors: return Text("✌️")
    }
  }
}

final class ViewModel: ObservableObject {
  private var subscriptions: Set<AnyCancellable> = []
  @Published var gameMode: GameMode = .unlimit
  @Published var gameStrategy: GameStrategy = .toWin
  @Published var gameGesture: Gesture = .rock
  @Published var score: Int = 0
  
  
  func toggleStrategy() {
    self.gameStrategy = self.gameStrategy.toggle()
  }
  
}
