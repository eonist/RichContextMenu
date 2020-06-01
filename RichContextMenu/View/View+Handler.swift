import UIKit
/**
 * Handler
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
