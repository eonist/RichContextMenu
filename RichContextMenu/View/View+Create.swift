import UIKit
/**
 * Create
 */
extension View {
   /**
    * imageview
    */
   func createImageView() -> UIImageView {
      let imgView: UIImageView = .init(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
      imgView.backgroundColor = .systemPink
      imgView.layer.cornerRadius = 10
      addSubview(imgView)
      return imgView
   }
}
