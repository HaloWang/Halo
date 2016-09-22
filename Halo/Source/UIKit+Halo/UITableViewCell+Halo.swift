
import UIKit

public extension UITableViewCell {

    func selectionStyle(_ selectionStyle: UITableViewCellSelectionStyle) -> Self {
        self.selectionStyle = selectionStyle
        return self
    }

    func noneSelectionStyle() -> Self {
        selectionStyle = .none
        return self
    }

    func accessoryType(_ accessoryType: UITableViewCellAccessoryType) -> Self {
        self.accessoryType = accessoryType
        return self
    }

    func accessoryTypeDisclosureIndicator() -> Self {
        accessoryType = .disclosureIndicator
        return self
    }

    func text(_ text: String?) -> Self {
        self.textLabel?.text = text
        return self
    }

    func detail(_ detail: String?) -> Self {
        self.detailTextLabel?.text = detail
        return self
    }

}


open class WCValue1TableViewCell: UITableViewCell {

    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
