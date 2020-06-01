import UIKit
/**
 * Create
 */
extension PreviewVC {
   /**
    * image view
    */
   func createImageView() -> UIImageView {
      let size: CGSize = .init(width: PreviewVC.size.width , height: PreviewVC.size.width)
      let imgView: UIImageView = .init(frame: .init(origin: .zero, size: size))
      imgView.backgroundColor = color
      view.addSubview(imgView)
      return imgView
   }
}
