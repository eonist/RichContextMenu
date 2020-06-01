import UIKit
/**
 * Custom preview
 * - Note: You cant set custom background to this controller
 * - Fixme: ⚠️️ Make custom RichContextMenuController with support for backround etc
 * - Fixme: ⚠️️ there is a bug in the apple code tht throws constraint errors etc.
 */
class PreviewVC: UIViewController {
   lazy var imageView: UIImageView = createImageView()
   let color: UIColor
   override func viewDidLoad() {
      super.viewDidLoad()
      preferredContentSize = PreviewVC.size
      _ = imageView
   }
   init(color: UIColor) {
      self.color = color
      super.init(nibName: nil, bundle: nil)
   }
   /**
    * Boilerplate
    */
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
