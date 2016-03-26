
import UIKit

public class HaloApplication {
    
    /// 获取缓存容量
    public static func GetCacheCapacity(result:(MB:Double, cachesFilePath:String?) -> Void) {
        /// 缓存文件大小
        var folderSize : Double = 0
        
        let _MB : Double = 1024 * 1024
        
        let manager = NSFileManager.defaultManager()
        
        guard let cachesPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first else {
            result(MB: folderSize, cachesFilePath: nil)
            return
        }
        
        let _fileNameS = manager.subpathsAtPath(cachesPath)
        
        guard let fileNameS = _fileNameS else {
            result(MB: folderSize, cachesFilePath: cachesPath)
            return
        }
        
        for fileName in fileNameS {
            let filePath = cachesPath + "/" + fileName
            let sizeNumber = try! manager.attributesOfItemAtPath(filePath)["NSFileSize"] as! NSNumber
            folderSize += sizeNumber.doubleValue
        }
        
        result(MB: folderSize / _MB, cachesFilePath: cachesPath)
    }
    
    /// 清空缓存
    public static func CleanCache(finish : (success:Bool) -> Void) {
        let manager = NSFileManager.defaultManager()
        guard let cachesPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first else {
            finish(success: false)
            return
        }
        
        let files = manager.subpathsAtPath(cachesPath)
        guard let fileNames = files else {
            finish(success: true)
            return
        }
        
        for fileName in fileNames {
            let filePath = cachesPath + "/" + fileName
            do {
                try manager.removeItemAtPath(filePath)
            } catch {
                
            }
        }
        finish(success: true)
    }
    
    /// 设置状态栏颜色
    public static func SetStatusBarStyle(style : UIStatusBarStyle, animated: Bool) {
        guard UIApplication.sharedApplication().statusBarStyle != style else {
            return
        }
        UIApplication.sharedApplication().setStatusBarStyle(style, animated: animated)
    }
    
    /// 当前应用版本号
    public static var Version : String {
        
        let unknownValue = "Unknown"
        
        guard let dictionary = NSBundle.mainBundle().infoDictionary else {
            ccLogWarning("Can not find Info.plist")
            return unknownValue
        }
        
        guard let versionString = dictionary["CFBundleShortVersionString"] as? String else {
            ccLogWarning("CFBundleShortVersionString is not String")
            return unknownValue
        }
        
        return versionString
    }
    
    /// 当前应用编译号
    public static var Build : String {
        let unknownValue = "00001"
        
        guard let dictionary = NSBundle.mainBundle().infoDictionary else {
            ccLogWarning("Can not find Info.plist")
            return unknownValue
        }
        
        guard let buildString = dictionary["CFBundleVersion"] as? String else {
            ccLogWarning("CFBundleVersion is not String")
            return unknownValue
        }
        
        return buildString
    }
}

//public var ScreenBounds : CGRect {
//    return UIScreen.mainScreen().bounds
//}

/// ### ScreenBounds
///
/// Only support portrait
public let ScreenBounds = UIScreen.mainScreen().bounds

/// ### ScreenHeight
///
/// Only support portrait
public var ScreenHeight : CGFloat {
    return ScreenBounds.size.height
}

/// ### ScreenWidth
///
/// Only support portrait
public var ScreenWidth : CGFloat {
    return ScreenBounds.size.width
}

/**
 根据屏幕宽度选择不同的值进行适配，针对其他尺寸默认返回 _375
 
 - parameter _320: 4s/5/5s
 - parameter _375: 6/6s
 - parameter _414: 6p/6sp
 
 */
public func ValueWithScreenWidth_320(_320 : Halo.CGFloatable, _375 : Halo.CGFloatable, _414 : Halo.CGFloatable) -> CGFloat {
    switch ScreenWidth {
    case 414.f:
        return _414.f
    case 320.f:
        return _320.f
    default:
        return _375.f
    }
}

/**
 根据屏幕高度分别选择不同的值进行适配，针对其他尺寸默认返回 _667
 
 - parameter _480: 4s
 - parameter _568: 5/5s
 - parameter _667: 6/6s
 - parameter _736: 6p/6sp
 
 */
public func ValueWithScreenHeight_480(_480 : Halo.CGFloatable, _568: Halo.CGFloatable, _667: Halo.CGFloatable, _736: Halo.CGFloatable) -> CGFloat {
    switch ScreenHeight {
    case 480.f:
        return _480.f
    case 568.f:
        return _568.f
    case 736.f:
        return _736.f
    default:
        return _667.f
    }
}

/// 用于 navigationController.navigationBar.opaque = true 的，含有 UITableView 的 UIViewController 的 UIScrollView
///
/// CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - NavigationBarHeight)
public var OpaqueNaviListHeight : CGRect {
    return CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - NavigationBarHeight)
}

/// 返回一个高度为 （屏幕高度 - 导航栏高度） 的 rect 值
public var OpaqueBarsBounds : CGRect {
    return CGRect(x: ScreenBounds.origin.x, y: ScreenBounds.origin.y, width: ScreenWidth, height: ScreenHeight - NavigationBarHeight)
}

/// 64
public var NavigationBarHeight : CGFloat = 64

/// 49
public var TabBarHeight : CGFloat = 49

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

/// 当前系统版本
public var CurrentSystemVersion : Float {
    return (UIDevice.currentDevice().systemVersion as NSString).floatValue
}
