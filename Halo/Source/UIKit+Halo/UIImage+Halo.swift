
import UIKit

/// 从 bundle 中按照文件名取图片
public func PNGNamed(name : String) -> UIImage {
	
	if let imageResourceString = NSBundle.mainBundle().pathForResource(name, ofType: "png"), image = UIImage(contentsOfFile: imageResourceString) {
		return image
	} else {
		print("⚠️Halo.framework: Can not find image named \"\(name).png\" in mainBundle")
		return UIImage()
	}
	
}

public extension UIImage {
	
    var pngData : NSData {
		return UIImagePNGRepresentation(self) ?? NSData()
	}
	
    var width : CGFloat {
		return size.width
	}
	
    var height : CGFloat {
		return size.height
	}
	
	class public func pngImageWithColor(color:UIColor, size: CGSize) -> UIImage {
		UIGraphicsBeginImageContext(size)
		let context = UIGraphicsGetCurrentContext()
		CGContextSetFillColorWithColor(context, color.CGColor)
		CGContextFillRect(context, CGRect(x: 0, y: 0, width: size.width, height: size.height))
		let pureColorImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return pureColorImage
	}
    
    convenience init(pngWithColor:UIColor, size:CGSize) {
        self.init()
    }
    
    class func imageWithColor(color:UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let pureColorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return pureColorImage
    }
    
    var edgeInsetsToBubble : UIEdgeInsets {
        let center = CGPoint(x: size.width / 2, y: size.height / 2 )
        return UIEdgeInsets(top: center.y, left: center.x, bottom: center.y, right: center.x)
    }
    
    var resizeableImage : UIImage {
        return resizableImageWithCapInsets(edgeInsetsToBubble, resizingMode: UIImageResizingMode.Stretch)
    }
}
