// 

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Basics")) {
          NavigationLink(
            destination: GuessFlag(
              store: Store(
                initialState: GuessFlagState(),
                reducer: guessFlagReducer,
                environment: GuessFlagEnvironment())
            )
          ) {
            Text("Guess Flag")
          }
          .navigationViewStyle(DoubleColumnNavigationViewStyle())
          
          NavigationLink(destination: GoodRest()) {
            Text("Good Rest")
          }
        }
      }.navigationBarTitle("Composable-Architecture Rebuild")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
