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
extension View {
   /**
    * imageview
    */
   func createImageView() -> UIImageView {
      let imgView: UIImageView = .init(frame: .init(origin: .init(x: 0, y: 0), size: .init(width: 100, height: 100)))
      imgView.backgroundColor = .systemPink
      imgView.layer.cornerRadius = 10
      addSubview(imgView)
      return imgView
   }
}
/**
 * handler
 */
extension View {
   /**
    * interaction handler
    */
   func addInteractionHandler() {
      let interaction = UIContextMenuInteraction(delegate: self)
      imageView.addInteraction(interaction)
      imageView.isUserInteractionEnabled = true
   }
}
/**
 * Delegate
 */
extension View: UIContextMenuInteractionDelegate {
   /**
    * On long press
    */
   func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
      let obtainedColor: UIColor = .systemYellow // Use collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath to get data from cell etc
      let previewProvider: UIContextMenuContentPreviewProvider = createPreviewProvider(color: obtainedColor)
      return UIContextMenuConfiguration(identifier: nil, previewProvider: previewProvider) { _ -> UIMenu? in
         return self.createContextMenu()
      }
   }
}
/**
 * Helper
 */
extension View {
   /**
    * preview view controller provider block, called when the menu is about to be presented.
    * - Note: for table view override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
    */
   private func createPreviewProvider(color: UIColor) -> UIContextMenuContentPreviewProvider {
      { PreviewVC(color: color) } // Create a preview view controller and return it inside a block
   }
  
   /**
    * ContextMenu
    * - Note: action provider block, called when the menu is about to be presented.
    */
   private func createContextMenu() -> UIMenu {
      let actionOne = UIAction(title: "Copy password", image: nil) { _ in // UIImage(systemName: "square.and.arrow.up")
         print("do action")
      }
      
      let actionTwo = UIAction(title: "Delete item", image: nil, attributes: .destructive) { _ in // UIImage(systemName: "photo")
         print("do action")
      }
      return UIMenu(title: "", children: [actionOne, actionTwo])
   }
}
/**
 * Custom preview
 */
class PreviewVC: UIViewController {
   static let size: CGSize = {
      let w: CGFloat = 320 //UIScreen.main.bounds.size.width - 124
      let h: CGFloat = 320//UIScreen.main.bounds.size.height - 200
      return .init(width:w, height: h)
   }()
   lazy var imageView: UIImageView = createImageView()
   let color: UIColor
   override func viewDidLoad() {
      super.viewDidLoad()
      _ = imageView
      preferredContentSize = PreviewVC.size
      view.translatesAutoresizingMaskIntoConstraints = false
   }
//   override func loadView() {
//      view = imageView
//   }
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
extension PreviewVC {
   /**
    * image view
    */
   func createImageView() -> UIImageView {
      let size: CGSize = .init(width: PreviewVC.size.width - 48, height: PreviewVC.size.width - 48)
      let imgView: UIImageView = .init()
      imgView.backgroundColor = color
      view.addSubview(imgView)
      imgView.anchorAndSize(to: view, width: size.width, height: size.height, align: .centerCenter, alignTo: .centerCenter)
      return imgView
   }
}
