// 

import SwiftUI

struct ScaleCircleLoadingView: View {
  private let animationDuration: TimeInterval = 0.3
  private let delayTimeInterval: TimeInterval = 0.15
  private let circleSize: CGFloat = 10
  @Binding var shouldAnimate: Bool
  
  var body: some View {
    HStack {
      Circle()
        .fill(Color.blue)
        .frame(width: circleSize, height: circleSize)
        .scaleEffect(shouldAnimate ? 1.0 : 0.6)
        .animation(Animation.easeInOut(duration: animationDuration).repeatForever())
      
      Circle()
        .fill(Color.blue)
        .frame(width: circleSize, height: circleSize)
        .scaleEffect(shouldAnimate ? 1.0 : 0.6)
        .animation(Animation.easeInOut(duration: animationDuration).repeatForever().delay(delayTimeInterval))
      
      Circle()
        .fill(Color.blue)
        .frame(width: circleSize, height: circleSize)
        .scaleEffect(shouldAnimate ? 1.0 : 0.6)
        .animation(Animation.easeInOut(duration: animationDuration).repeatForever().delay(2 * delayTimeInterval))
    }
  }
}

struct ScaleCircleLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    ScaleCircleLoadingView(shouldAnimate: .constant(false))
  }
}
