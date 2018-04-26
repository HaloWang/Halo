
import UIKit

/// 系统分割线颜色 -> RGB(200, 199, 204)
public var SystemSeparatorColor: UIColor {
	return UIColor(red: 200/255, green: 199/255, blue: 204/255, alpha: 1)
}

public func RGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
	return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
}

public func RGBA(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
	return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}

/// "RRGGBBAA"
public func HEX(_ hexString: String) -> UIColor {
    return UIColor(hexString: hexString)
}

public extension UIColor {

    @discardableResult
    func alpha(_ alpha: Halo.CGFloatable) -> UIColor {
        var _red   = 0.f
        var _green = 0.f
        var _blue  = 0.f
        var _alpha = 0.f
        getRed(&_red, green: &_green, blue: &_blue, alpha: &_alpha)
        return UIColor(red: _red, green: _green, blue: _blue, alpha: alpha.f)
    }

     /**
     使用 hex 色值初始化 UIColor

     - parameter hexString: 色值，格式为 "1234EF"

     */
	convenience init(hexString: String) {
		var red: CGFloat = 0.0
		var green: CGFloat = 0.0
		var blue: CGFloat = 0.0
		var alpha: CGFloat = 1.0

        let _hexString = hexString.hasPrefix("#") ? hexString : "#\(hexString)"

        let index   = _hexString.characters.index(_hexString.startIndex, offsetBy: 1)
        let hex     = _hexString.substring(from: index)
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
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
                ccLogWarning("Number of characters after '#' should be either 3, 4, 6 or 8")
            }
        } else {
            ccLogWarning("Scan hex error")
        }

		self.init(red:red, green:green, blue:blue, alpha:alpha)
	}
}
