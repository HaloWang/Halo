
import UIKit

public extension UITableViewCell {
    func selectionStyle(selectionStyle:UITableViewCellSelectionStyle) -> Self {
        self.selectionStyle = selectionStyle
        return self
    }
    
    /// 返回 "Halo.ReuseIdentifier.YOUR_CLASS_NAME"
    static var reuseIdentifier : String {
        return "Halo.ReuseIdentifier." + NSStringFromClass(self)
    }
}
