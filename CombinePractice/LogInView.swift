// 

import SwiftUI

struct LogInView: View {
  
  @ObservedObject var viewModel = LogInViewModel()
  var logInButtonValid: Bool {
    phoneNumber.count >= 11 && password.count >= 6
  }
  @State var phoneNumber: String = ""
  @State var password: String = ""
  
  @State var phoneNumberFocused: Bool = false
  @State var passwordFocused: Bool = false
  
  var body: some View {
    GeometryReader { geometry in
      self.createBody(with: geometry.size)
    }
    .gesture(
      DragGesture()
        .onChanged { _ in
          self.endEditing()
        }
    )
  }
  
  private func createBody(with size: CGSize) -> some View {
    VStack(spacing: 28) {
      VStack(alignment: .leading, spacing: 6) {
        TextField("Please input your phone number", text: $phoneNumber, onEditingChanged: { _ in
          if self.phoneNumberFocused == false {
            self.phoneNumberFocused = true
          }
        }, onCommit: {
          self.phoneNumberFocused = false
        })
        HorizontalAnimatableView(focused: $phoneNumberFocused)
      }
        .frame(width: size.width - 64, height: 30)
      
      VStack(alignment: .leading, spacing: 6) {
        TextField("Please input your password", text: $password, onEditingChanged: { _ in
          if self.passwordFocused == false {
            self.passwordFocused = true
          }
        }, onCommit: {
          self.passwordFocused = false
        })
        HorizontalAnimatableView(focused: $passwordFocused)
      }
        .frame(width: size.width - 64, height: 30)
      
      Button(action: {
        print("did click log in")
      }) {
        Text("Log In")
          .fontWeight(.bold)
          .font(.headline)
          .foregroundColor(.white)
          .frame(width: 120, height: 36)
          .background(
            Capsule()
              .foregroundColor(logInButtonValid ? Color.blue : Color.gray)
        )
      }
      .disabled(!logInButtonValid)
    }
  }
  
  private func endEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

struct HorizontalAnimatableView: View {
  @Binding var focused: Bool
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        HorizontalLine(color: .gray)
          .frame(width: geometry.size.width, height: 2)
        HorizontalLine(color: .blue)
          .frame(width: self.focused ? geometry.size.width : .zero, height: 2)
          .animation(.easeInOut)
      }
    }
  }
}

struct HorizontalLine: View {
  let color: Color
  var body: some View {
    HorizontalLineShape()
      .fill(color)
      .frame(minWidth: .zero, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
  }
}

struct HorizontalLineShape: Shape {
  func path(in rect: CGRect) -> Path {
    let rect = CGRect(x: .zero, y: .zero, width: rect.width, height: rect.height)
    var path = Path()
    path.addRoundedRect(in: rect, cornerSize: CGSize(width: 2, height: 2))
    return path
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}
