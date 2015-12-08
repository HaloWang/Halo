
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
    
    func text(text:String?) -> Self {
        self.textLabel?.text = text
        return self
    }
    
    func detail(detail:String?) -> Self {
        self.detailTextLabel?.text = detail
        return self
    }
    
}


public class WCValue1TableViewCell: UITableViewCell {
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
