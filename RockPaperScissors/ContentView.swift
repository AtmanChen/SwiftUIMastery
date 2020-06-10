// 

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  static private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [.blue, .black]),
        startPoint: .top,
        endPoint: .bottom)
      VStack(spacing: 30) {
        Spacer()
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
        
        GestureView(gesture: viewModel.gameGesture)
          .padding()
          .font(.system(size: 100))
        
        Spacer()
        
        HStack {
          ForEach(Gesture.allCases, id: \.self) { gesture in
            Button(
              action: {
                // TODO: gesture action
              }
            ) {
              GestureView(gesture: gesture)
                .font(.system(size: 50))
                .padding()
            }
          }
        }
        
        Button(
          action: {
            self.viewModel.gameMode = self.viewModel.gameMode.toggleMode()
        }
        ) {
          Text(viewModel.gameMode.description)
            .foregroundColor(.white)
            .font(.title)
        }
        Spacer()
      }
    }
      .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
