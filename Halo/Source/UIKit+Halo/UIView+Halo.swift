
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
    public func superView(superView : UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    public func userInteractionEnabled(userInteractionEnabled : Bool) -> Self {
        self.userInteractionEnabled = userInteractionEnabled
        return self
    }
    
    public func backgroundColor(backgroundColor : UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    public func cornerRadius(radius : CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
    
    public func alpha(alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    public func frame(frame:CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    public func contentMode(contentMode : UIViewContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    /**
    设置圆角
    
    - parameter radius:      圆角半径
    - parameter borderWidth: 描边宽度
    - parameter borderColor: 描边颜色
    
    - returns: self
    */
    public func cornerRadius(radius : CGFloat, borderWidth : CGFloat, borderColor : UIColor) -> Self {
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
    public func setCornerRadius(radius : CGFloat, forCorners corners : UIRectCorner) -> Self {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radius.size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = maskPath.CGPath
        layer.mask = shapeLayer
        return self
    }
    
    /// 返回某个 UIView 相对于当前屏幕的 rect
    public var relativeFrameToWindow: CGRect {
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