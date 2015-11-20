
import UIKit

public extension UITableViewCell {
    
    func selectionStyle(selectionStyle:UITableViewCellSelectionStyle) -> Self {
        self.selectionStyle = selectionStyle
        return self
    }
    
    func noneSelectionStyle() -> Self {
        selectionStyle = .None
        return self
    }
    
    func accessoryType(accessoryType:UITableViewCellAccessoryType) -> Self {
        self.accessoryType = accessoryType
        return self
    }
    
    func accessoryTypeDisclosureIndicator() -> Self {
        accessoryType = .DisclosureIndicator
        return self
    }
}
