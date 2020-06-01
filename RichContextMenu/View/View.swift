import UIKit
import Spatial

class View: UIView {
   lazy var imageView: UIImageView = createImageView()
   override init(frame: CGRect) {
      super.init(frame: frame)
      _ = imageView
      addInteractionHandler()
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
