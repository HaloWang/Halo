
import UIKit

public extension UITextField {
	
	public var displaySize: CGSize {
		return (self.text as NSString).boundingRectWithSize(CGSize(width: Double(MAXFLOAT), height: Double(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil).size
	}
	
	public func text(text : String) -> Self {
		self.text = text
		return self
	}
    
    public func textColor(color : UIColor) -> Self {
        self.textColor = color
        return self
    }
	
	public func placeholder(placeholder : String) -> Self{
		self.placeholder = placeholder
		return self
	}
	
	public func leftWidth(leftWidth : CGFloat) -> Self {
		leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftWidth, height: 5))
		leftViewMode = UITextFieldViewMode.Always
		return self
	}
	
	public func textAlignment(textAlignment : NSTextAlignment) -> Self {
		self.textAlignment = textAlignment
		return self
	}
	
	public func keyboardType(keyboardType : UIKeyboardType) -> Self {
		self.keyboardType = keyboardType
		return self
	}
	
	public func secureTextEntry(secureTextEntry : Bool) -> Self {
		self.secureTextEntry = secureTextEntry
		return self
	}
	
	public func font(#systemFontOfSize:CGFloat) -> Self {
		return font(UIFont.systemFontOfSize(systemFontOfSize))
	}
	
	public func font(font : UIFont) -> Self {
		self.font = font
		return self
	}
	
	public func fontSize(fontSize : CGFloat) -> Self {
		font = UIFont(name: font.fontName, size: fontSize)
		return self
	}
	
}
