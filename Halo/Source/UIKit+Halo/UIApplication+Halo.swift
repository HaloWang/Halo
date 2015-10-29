
import UIKit

//public var ScreenBounds : CGRect {
//    return UIScreen.mainScreen().bounds
//}

public let ScreenBounds = UIScreen.mainScreen().bounds

public var ScreenHeight : CGFloat {
    return ScreenBounds.size.height
}

public var ScreenWidth : CGFloat {
    return ScreenBounds.size.width
}

public func CM(y y: CGFloatable, width: CGFloatable, height: CGFloatable) -> CGRect {
    return CGRect(x: (ScreenWidth - width)/2, y: y, width: width, height: height)
}

public var CurrentSystemVersion : Float {
    return (UIDevice.currentDevice().systemVersion as NSString).floatValue
}

public func SetStatusBarStyle(style : UIStatusBarStyle, animated: Bool) {
    UIApplication.sharedApplication().setStatusBarStyle(style, animated: animated)
}