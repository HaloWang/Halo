
import UIKit

public protocol HasText : class {
    var h_width : CGFloat { get }
    var h_text : String { get set }
    var h_textColor : UIColor { get set }
    var h_font : UIFont { get set }
    var h_textAlignment : NSTextAlignment { get set }
    var displayHeight : CGFloat { get }
}

extension HasText {
    
    public var h_width : CGFloat {
        if self is UIView {
            return (self as! UIView).frame.size.width
        } else {
            ccLogWarning("\"HasText\" only support UIView")
            return 0
        }
    }
    
    func text(text:String?) -> Self {
        h_text = text ?? ""
        return self
    }
    
    func textColor(color: UIColor) -> Self {
        h_textColor = color
        return self
    }
    
    func font(font: UIFont) -> Self {
        h_font = font
        return self
    }
    
    func textAlignmentCenter() -> Self {
        h_textAlignment = .Center
        return self
    }
    
    func textAlignment(textAlignment:NSTextAlignment) -> Self {
        h_textAlignment = textAlignment
        return self
    }
    
    func text(text : String, textColor : UIColor) -> Self {
        return self.text(text).textColor(textColor)
    }
    
    func font(systemFontOfSize systemFontOfSize:CGFloat) -> Self {
        return font(UIFont.systemFontOfSize(systemFontOfSize))
    }
    
    func fontSize(fontSize : CGFloat) -> Self {
        if let newSizeFont = UIFont(name: h_font.fontName, size: fontSize) {
            h_font = newSizeFont
        }
        return self
    }
    
    public var displayHeight : CGFloat {
        return (h_text as NSString).boundingRectWithSize(CGSize(width: h_width, height: CGFloat(MAXFLOAT)),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName:h_font], context: nil).size.height
    }
}

public extension UIFont {
	static var systemFontName : String {
		return UIFont.systemFontOfSize(12).fontName
	}
}
