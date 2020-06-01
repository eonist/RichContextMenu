import UIKit
/**
 * Delegate
 */
extension View: UIContextMenuInteractionDelegate {
   /**
    * On long press / force touch
    */
   func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
      let obtainedColor = UIColor.systemPurple // Use collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath to get data from cell etc
      let previewProvider = PreviewVC.createPreviewProvider(color: obtainedColor)
      return UIContextMenuConfiguration(identifier: nil, previewProvider: previewProvider) { _ -> UIMenu? in
         PreviewVC.createContextMenu(onCopy: { print("copy") }, onDelete: { print("delete") })
      }
   }
}
