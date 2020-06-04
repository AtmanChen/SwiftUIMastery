// 

import SwiftUI

struct HStackIntroductionView: View {
  var body: some View {
    VStack(spacing: 20) {
      Text("HStack").font(.largeTitle)
      Text("Introduction").font(.title).foregroundColor(.secondary)
      Text("das0dasdsadjsaiodiouiusoa83128038092183281832189089dasjljdkajslkdkjlasdas")
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.orange)
        .foregroundColor(.white)
      HStack {
        Text("Leading")
        Text("Center")
        Text("Trailing")
      }
      .padding()
      .border(Color.orange)
      
      HStack(spacing: 10) {
        Image(systemName: "1.circle")
        Image(systemName: "2.circle")
        Image(systemName: "3.circle")
      }
      .padding()
      
      HStack(spacing: 20) {
        Image(systemName: "a.circle.fill")
        Image(systemName: "b.circle.fill")
        Image(systemName: "c.circle.fill")
        Image(systemName: "d.circle.fill")
        Image(systemName: "e.circle.fill")
      }
      .font(.largeTitle)
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(.orange)
      )
    }
  }
}

struct HStackIndroduction_Previews: PreviewProvider {
  static var previews: some View {
    HStackIntroductionView()
  }
}
