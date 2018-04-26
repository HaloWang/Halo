
import UIKit

public extension UIButton {

    /**
    设定 Target-Action. 触发条件为：TouchUpInside（按下，并在按钮内离开手指）
    - parameter target:         target
    - parameter upInsideAction: action
    - returns: self
    */
    @discardableResult
    func target(_ target: AnyObject?, upInsideAction action: Selector) -> Self {
        addTarget(target, action : action, for:.touchUpInside)
        return self
    }

    /// The image of UIControlState.normal
    ///
    /// - parameter image: The image yout wants to set
    ///
    /// - returns: self
    @discardableResult
    func backgroundImageForNormal(_ image: UIImage?) -> Self {
        setBackgroundImage(image, for: UIControlState())
        return self
    }
    @discardableResult
    func imageForNormal(_ image: UIImage?) -> Self {
        setImage(image, for: UIControlState())
        return self
    }
    @discardableResult
    func title(_ title: String?) -> Self {
        setTitle(title, for: UIControlState())
        return self
    }
    @discardableResult
    func titleColor(_ titleColor: UIColor) -> Self {
        setTitleColor(titleColor, for: UIControlState())
        return self
    }
    @discardableResult
    func titleFontSize(_ titleFontSize: CGFloat) -> Self {
        _ = titleLabel?.fontSize(titleFontSize)
        return self
    }
    @discardableResult
    func titleSystemFontOfSize(_ titleSystemFontOfSize: CGFloat) -> Self {
        _ = titleLabel?.font(systemFontOfSize: titleSystemFontOfSize)
        return self
    }
    @discardableResult
    func enabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }
    /**
    同时设定 title 和 titleColor
    - parameter title:      标题文本
    - parameter titleColor: 标题文本颜色
    - returns: self
    */
    @discardableResult
    func title(_ title: String?, titleColor: UIColor) -> Self {
        return self.title(title).titleColor(titleColor)
    }
    @discardableResult
    func titleFont(_ font: UIFont) -> Self {
        _ = titleLabel?.font(font)
        return self
    }

}
