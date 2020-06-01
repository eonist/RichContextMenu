import UIKit
/**
 * Helper
 */
extension PreviewVC {
   /**
    * preview view controller provider block, called when the menu is about to be presented.
    * - Note: for table view override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
    */
   static func createPreviewProvider(color: UIColor) -> UIContextMenuContentPreviewProvider {
      { PreviewVC(color: color) } // Create a preview view controller and return it inside a block
   }
   /**
    * ContextMenu
    * - Note: action provider block, called when the menu is about to be presented.
    */
   static func createContextMenu(onCopy: @escaping () -> Void, onDelete: @escaping () -> Void) -> UIMenu {
      let actionOne = UIAction(title: "Copy password", image: UIImage(systemName: "doc.on.doc")) { _ in // UIImage(systemName: "square.and.arrow.up")
         onCopy()
      }
      let deleteCancel = UIAction(title: "Cancel", image: UIImage(systemName: "xmark")) { action in }
      let deleteConfirmation = UIAction(title: "Delete", image: UIImage(systemName: "checkmark"), attributes: .destructive) { action in
         onDelete()
      }
      // The delete sub-menu is created like the top-level menu, but we also specify an image and options
      let delete = UIMenu(title: "Delete", image: UIImage(systemName: "trash"), options: .destructive, children: [deleteCancel, deleteConfirmation])
      return UIMenu(title: "", children: [actionOne, delete])
   }
}
