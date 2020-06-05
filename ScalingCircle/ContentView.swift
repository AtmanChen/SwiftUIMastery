// 

import SwiftUI

struct ContentView: View {
  @State var loading: Bool = false
  var body: some View {
    NavigationView {
      List {
        if loading == true {
          HStack {
            Spacer()
            ScaleCircleLoadingView(shouldAnimate: $loading)
            Spacer()
          }
        }
        ForEach(0..<10) { index in
          Text("Row \(index)")
        }
      }
      .gesture(
        DragGesture()
          .onChanged { value in
            if value.translation.height >= 10 {
              self.loading = true
            } else {
              self.loading = false
            }
          }
      )
      .navigationBarTitle("pull refresh")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
