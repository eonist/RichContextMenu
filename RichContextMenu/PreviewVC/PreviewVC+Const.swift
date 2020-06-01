import UIKit
/**
 * Const
 */
extension PreviewVC {
   static let size: CGSize = {
      let w: CGFloat = 320 //UIScreen.main.bounds.size.width - 124
      let h: CGFloat = 320//UIScreen.main.bounds.size.height - 200
      return .init(width:w, height: h)
   }()
}
