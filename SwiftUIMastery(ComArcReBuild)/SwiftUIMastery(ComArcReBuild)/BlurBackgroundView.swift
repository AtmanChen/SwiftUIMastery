// 

import UIKit
import SwiftUI

public struct BlurBackground: UIViewRepresentable {
  public var style: UIBlurEffect.Style = .systemMaterial
  
  public func makeUIView(context: Context) -> UIVisualEffectView {
    UIVisualEffectView(effect: UIBlurEffect(style: style))
  }
  
  public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    uiView.effect = UIBlurEffect(style: style)
  }
}
