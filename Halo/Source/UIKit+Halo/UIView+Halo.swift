
import UIKit

public func AnimateWithDuration(duration: NSTimeInterval, @noescape _ animations: () -> Void) {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(duration)
    animations()
    UIView.commitAnimations()
}

public func AnimateWithDuration(duration: NSTimeInterval, _ animations: () -> Void, _ completion: (() -> Void)?) {
    let outCompletion = completion
    UIView.animateWithDuration(duration, animations: animations, completion: { (_) -> Void in
        outCompletion?()
    })
}

public extension UIView {
    
    func addSubviews(views:[UIView]) -> Self {
        for view in views {
            addSubview(view)
        }
        return self
    }
    
    /**
    设置 view.superView
    - parameter superView: 父视图
    - returns: self
    */
    func superView(superView : UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    func userInteractionEnabled(userInteractionEnabled : Bool) -> Self {
        self.userInteractionEnabled = userInteractionEnabled
        return self
    }
    
    func backgroundColor(backgroundColor : UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    func cornerRadius(radius : CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
    
    func alpha(alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    func frame(frame:CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    func frame(x x: CGFloatable, y: CGFloatable, width: CGFloatable, height: CGFloatable) -> Self {
        return frame(CGRect(x: x.f, y: y.f, width: width.f, height: height.f))
    }
    
    /// 参考 CM
    func cm(y y: CGFloatable, width: CGFloatable, height: CGFloatable) -> Self {
        self.frame = CM(y: y, width: width, height: height)
        return self
    }
    
    /// 参考 SWCM
    func swcm(y y: CGFloatable, height: CGFloatable) -> Self {
        self.frame = SWCM(y: y, height: height)
        return self
    }
    
    func contentMode(contentMode : UIViewContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }

    /// 设置 contentMode 为 .Center
    func contentModeCenter() -> Self {
        self.contentMode = .Center
        return self
    }
    
    /**
    设置圆角
    
    - parameter radius:      圆角半径
    - parameter borderWidth: 描边宽度
    - parameter borderColor: 描边颜色
    
    - returns: self
    */
    func cornerRadius(radius : CGFloat, borderWidth : CGFloat, borderColor : UIColor) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        return self
    }
    
    /**
    设置某几个角的属性为某个 radius 值
    
    - parameter radius:  半径
    - parameter corners: 哪些角
    
    */
    func setCornerRadius(radius : CGFloat, forCorners corners : UIRectCorner) -> Self {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radius.size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = maskPath.CGPath
        layer.mask = shapeLayer
        return self
    }
    
    /// 返回某个 UIView 相对于当前屏幕的 rect
    var relativeFrameToWindow: CGRect {
        var screen_X: CGFloat = 0
        var screen_Y: CGFloat = 0
        var tempView = self
        while !tempView.isKindOfClass(UIWindow) {
            screen_X += tempView.frame.origin.x
            screen_Y += tempView.frame.origin.y
            tempView = tempView.superview!
            if tempView.isKindOfClass(UIScrollView) {
                screen_X -= (tempView as! UIScrollView).contentOffset.x
                screen_Y -= (tempView as! UIScrollView).contentOffset.y
            }
        }
        
        return CGRect(x: screen_X, y: screen_Y, width: self.frame.size.width, height: self.frame.size.height)
    }
}

public extension UIVisualEffectView {
    /**
     快速创建模糊视图
     
     - parameter blur: UIBlurEffectStyle
     
     - returns: 模糊视图
     */
    convenience init(blur:UIBlurEffectStyle) {
        self.init(effect: UIBlurEffect(style: blur))
    }
}
