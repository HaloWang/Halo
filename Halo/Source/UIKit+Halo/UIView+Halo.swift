
import UIKit

public func AnimateWithDuration(_ duration: TimeInterval, _ animations: () -> Void) {
    UIView.beginAnimations(nil, context: nil)
    UIView.setAnimationDuration(duration)
    animations()
    UIView.commitAnimations()
}

public func AnimateWithDuration(_ duration: TimeInterval, _ animations: @escaping () -> Void, _ completion: (() -> Void)?) {
    let outCompletion = completion
    UIView.animate(withDuration: duration, animations: animations, completion: { (_) -> Void in
        outCompletion?()
    })
}

public extension UIView {

    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self {
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
    @discardableResult
    func superView(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }

    @discardableResult
    func superview(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }

    @discardableResult
    func userInteractionEnabled(_ userInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = userInteractionEnabled
        return self
    }

    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }

    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        return self
    }

    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }

    @discardableResult
    func frame(x: CGFloatable, y: CGFloatable, width: CGFloatable, height: CGFloatable) -> Self {
        return frame(CGRect(x: x.f, y: y.f, width: width.f, height: height.f))
    }

    /// 参考 CM
    @discardableResult
    func cm(y: CGFloatable, width: CGFloatable, height: CGFloatable) -> Self {
        self.frame = CM(y: y, width: width, height: height)
        return self
    }

    /// 参考 SWCM
    @discardableResult
    func swcm(y: CGFloatable, height: CGFloatable) -> Self {
        self.frame = SWCM(y: y, height: height)
        return self
    }

    @discardableResult
    func contentMode(_ contentMode: UIViewContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }

    /// 设置 contentMode 为 .Center
    @discardableResult
    func contentModeCenter() -> Self {
        self.contentMode = .center
        return self
    }

    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }

    @discardableResult
    func hidden(_ hidden: Bool) -> Self {
        self.isHidden = hidden
        return self
    }

    /**
    设置圆角

    - parameter radius:      圆角半径
    - parameter borderWidth: 描边宽度
    - parameter borderColor: 描边颜色

    - returns: self
    */
    @discardableResult
    func cornerRadius(_ radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) -> Self {
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        return self
    }

    /**
    设置某几个角的属性为某个 radius 值

    - parameter radius:  半径
    - parameter corners: 哪些角

    */
    @discardableResult
    func setCornerRadius(_ radius: CGFloat, forCorners corners: UIRectCorner) -> Self {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radius.size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = maskPath.cgPath
        layer.mask = shapeLayer
        return self
    }

    /// 返回某个 UIView 相对于其所处 UIWindow 的 rect（一般情况下该 Rect 等于该 UIView 相对于屏幕的 Rect）
    var relativeFrameToWindow: CGRect {
        var screen_X: CGFloat = 0
        var screen_Y: CGFloat = 0
        var tempView = self
        while !tempView.isKind(of: UIWindow.self) {
            screen_X += tempView.frame.origin.x
            screen_Y += tempView.frame.origin.y
            tempView = tempView.superview!
            if tempView.isKind(of: UIScrollView.self) {
                screen_X -= (tempView as! UIScrollView).contentOffset.x
                screen_Y -= (tempView as! UIScrollView).contentOffset.y
            }
        }

        return CGRect(x: screen_X, y: screen_Y, width: self.frame.size.width, height: self.frame.size.height)
    }

    /// UIView 自己的截图
    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// 异步获取截图
    func screenshot(_ finish: @escaping (UIImage?) -> Void) {
        DispatchQueue(label: LogString + ".Async", attributes: []).async {
            let image = self.screenshot
            DispatchQueue.main.async {
                finish(image)
            }
        }
    }
}

public extension UIVisualEffectView {
    /**
     快速创建模糊视图

     - parameter blur: UIBlurEffectStyle

     - returns: 模糊视图
     */
    convenience init(blur: UIBlurEffectStyle) {
        self.init(effect: UIBlurEffect(style: blur))
    }
}
