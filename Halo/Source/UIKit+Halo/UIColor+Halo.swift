
import UIKit

public let White  = UIColor.whiteColor()

public let Black  = UIColor.blackColor()

public let Clear  = UIColor.clearColor()

public let Red    = UIColor.redColor()

public let Yellow = UIColor.yellowColor()

public let Green  = UIColor.greenColor()

public let Blue   = UIColor.blueColor()

/// 系统分割线颜色 -> RGB(200, 199, 204)
public var SystemSeparatorColor : UIColor {
	return UIColor(red: 200/255, green: 199/255, blue: 204/255, alpha: 1)
}

public func RGB(red:CGFloat, _ green:CGFloat, _ blue:CGFloat) -> UIColor {
	return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
}

public func RGBA(red:CGFloat, _ green:CGFloat, _ blue:CGFloat, _ alpha:CGFloat) -> UIColor {
	return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}

/// "RRGGBBAA"
public func HEX(hexString:String) -> UIColor {
    return UIColor(hexString: hexString)
}

public extension UIColor {
    
    func alpha(alpha:Halo.CGFloatable) -> UIColor {
        var _red   = 0.f
        var _green = 0.f
        var _blue  = 0.f
        var _alpha = 0.f
        getRed(&_red, green: &_green, blue: &_blue, alpha: &_alpha)
        return UIColor(red: _red, green: _green, blue: _blue, alpha: alpha.f)
    }
	
	/**
	使用 hex 色值初始化 UIColor
	
	传入的 hexString格式可以为：
	
	--- RGB ---
	
	- 12F
	- #12F
	
	- 1234EF
	- #1234EF
	
	--- RGBA ---
	
	- 123F
	- #123F
	
	- 12345678
	- #123456EF
	
	*/
	convenience init(hexString: String) {
		var red :  CGFloat = 0.0
		var green: CGFloat = 0.0
		var blue : CGFloat = 0.0
		var alpha: CGFloat = 1.0
        
        var _hexString = hexString
        
        func setRGB() {
            let index   = _hexString.startIndex.advancedBy(1)
            let hex     = _hexString.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                switch (hex.characters.count) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
                }
            } else {
                print("Scan hex error")
            }
        }
		
		if _hexString.hasPrefix("#") {
			setRGB()
		} else {
            _hexString = "#\(_hexString)"
            setRGB()
		}
        
		self.init(red:red, green:green, blue:blue, alpha:alpha)
	}
}
