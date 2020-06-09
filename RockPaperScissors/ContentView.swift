// 

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [.blue, .black]),
        startPoint: .top,
        endPoint: .bottom)
      VStack(spacing: 30) {
        Text("石头剪刀布")
          .font(.largeTitle)
          .fontWeight(.semibold)
        Group {
          Text("总分: ")
            .font(.body)
            .foregroundColor(.white)
            +
            Text("\(viewModel.score)")
              .font(.title)
              .foregroundColor(.white)
        }
        .padding()
        .background(BlurBackground(style: .systemUltraThinMaterial))
        .cornerRadius(20)
        
        HStack {
          Text("如何")
            .foregroundColor(.white)
          Text(viewModel.gameStrategy.rawValue)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .background(viewModel.gameStrategy == .toWin ? Color.green : Color.red)
            .opacity(0.8)
            .clipShape(Capsule())
            .onTapGesture {
              self.viewModel.toggleStrategy()
          }
          Text("这局")
            .foregroundColor(.white)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
