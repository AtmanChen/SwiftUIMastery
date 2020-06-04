// 

import SwiftUI

struct HStackAlignment: View {
  var body: some View {
    VStack(spacing: 20) {
      Text("HStack Alignment")
        .font(.largeTitle)
      Text("Vertical Alignment")
        .foregroundColor(.gray)
        .font(.title)
      Text("By default views within an HStack are vertically aligned in the center.")
        .font(.title)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.orange)
      HStack {
        Rectangle()
          .foregroundColor(.orange)
          .frame(width: 25)
        Text("Leading")
        Spacer()
        Text("Center")
        Spacer()
        Text("Trailing")
      }
      .border(Color.orange)
      
      HStack(alignment: .top) {
        Rectangle()
          .foregroundColor(.orange)
          .frame(width: 25)
        Text("Leading")
        Spacer()
        Text("Top")
        Spacer()
        Text("Trailing")
      }
      .border(Color.orange)
      
      HStack(alignment: .bottom) {
        Rectangle()
          .foregroundColor(.orange)
          .frame(width: 25)
        Text("Leading")
        Spacer()
        Text("Bottom")
        Spacer()
        Text("Trailing")
      }
      .border(Color.orange)
    }
  }
}

struct HStackAlignment_Previews: PreviewProvider {
  static var previews: some View {
    HStackAlignment()
  }
}
