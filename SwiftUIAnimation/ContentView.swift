// 

import SwiftUI

struct ContentView: View {
  
  @State var change: Bool = false
  @State var dateString: String = ""
  
  
  var body: some View {
    Text(self.dateString)
      .font(.title)
      .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { date in
        self.dateString = date.description
      }
  }
  
}

struct AnimationExOne: View {
  @Binding var change: Bool
  var body: some View {
    VStack(spacing: 20) {
      Text("Animatable Properties")
        .font(.largeTitle)
      Text("Color")
        .foregroundColor(.gray)
      Text("You can animate the change from one color to another")
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
      Text("With Animation")
      VStack(alignment: change ? .center : .leading) {
        RoundedRectangle(cornerRadius: 20)
          .fill(change ? Color.blue : Color.orange)
          .frame(width: 100, height: 100)
          .opacity(change ? 0.5 : 1)
          .padding()
          .animation(.easeInOut)
          HStack {
            Spacer()
          }
      }
      
      Text("Without Animation")
      RoundedRectangle(cornerRadius: 20)
        .fill(change ? Color.blue : Color.orange)
        .padding()
      Button("Change") {
        self.change.toggle()
      }
    }
    .font(.title)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
