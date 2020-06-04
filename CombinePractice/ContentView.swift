// 

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = LogInViewModel()
  var body: some View {
    LogInView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
