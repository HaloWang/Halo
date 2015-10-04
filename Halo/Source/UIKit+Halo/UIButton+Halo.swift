
import UIKit

public extension UIButton {
    
    /**
    设定 Target-Action. 触发条件为：TouchUpInside（按下，并在按钮内离开手指）
    - parameter target:         target
    - parameter upInsideAction: action
    - returns: self
    */
    public func target(target : AnyObject?, upInsideAction action: Selector) -> Self{
        addTarget(target, action : action, forControlEvents:.TouchUpInside)
        return self
    }
    /**
    设置 Normal 状态下，按钮的背景图片
    - parameter image: 图片
    - returns: self
    */
    public func backgroundImageForNormal(image : UIImage?) -> Self {
        setBackgroundImage(image, forState: .Normal)
        return self
    }
    public func imageForNormal(image : UIImage?) -> Self {
        setImage(image, forState: .Normal)
        return self
    }
    public func title(title : String) -> Self {
        setTitle(title, forState: .Normal)
        return self
    }
    public func titleColor(titleColor : UIColor) -> Self {
        setTitleColor(titleColor, forState: .Normal)
        return self
    }
    public func enabled(enabled: Bool) -> Self {
        self.enabled = enabled
        return self
    }
    /**
    同时设定 title 和 titleColor
    - parameter title:      标题文本
    - parameter titleColor: 标题文本颜色
    - returns: self
    */
    public func title(title: String, titleColor: UIColor) -> Self {
        return self.title(title).titleColor(titleColor)
    }
    public func titleFont(font:UIFont) -> Self {
        titleLabel?.font(font)
        return self
    }

}
