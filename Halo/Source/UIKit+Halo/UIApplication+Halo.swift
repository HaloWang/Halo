
import UIKit

//public var ScreenBounds : CGRect {
//    return UIScreen.mainScreen().bounds
//}

/// ScreenBounds
///
/// Only support portrait
public let ScreenBounds = UIScreen.mainScreen().bounds

/// ScreenHeight
///
/// Only support portrait
public var ScreenHeight : CGFloat {
    return ScreenBounds.size.height
}

/// ScreenWidth
///
/// Only support portrait
public var ScreenWidth : CGFloat {
    return ScreenBounds.size.width
}

/**
 - returns: 返回一个相对于 ScreenWidth 水平居中的 CGRect
 */
public func CM(y y: CGFloatable, width: CGFloatable, height: CGFloatable) -> CGRect {
    return CGRect(x: (ScreenWidth - width)/2, y: y, width: width, height: height)
}

/**
 - returns: 返回一个相对于 ScreenWidth 水平居中，宽度为 ScreenWidth 的 CGRect
 */
public func SWCM(y y: CGFloatable, height: CGFloatable) -> CGRect {
    return CGRect(x: 0, y: y, width: ScreenWidth, height: height)
}

public var CurrentSystemVersion : Float {
    return (UIDevice.currentDevice().systemVersion as NSString).floatValue
}

public func SetStatusBarStyle(style : UIStatusBarStyle, animated: Bool) {
    guard UIApplication.sharedApplication().statusBarStyle != style else {
        return
    }
    UIApplication.sharedApplication().setStatusBarStyle(style, animated: animated)
}