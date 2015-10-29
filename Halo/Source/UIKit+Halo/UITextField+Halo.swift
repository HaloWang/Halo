
import UIKit

public extension UITextField {
	
	public func placeholder(placeholder : String) -> Self{
		self.placeholder = placeholder
		return self
	}
	
	public func leftWidth(leftWidth : CGFloat) -> Self {
		leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftWidth, height: 5))
		leftViewMode = UITextFieldViewMode.Always
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
	
}

extension UITextField : HasText {
    
    var h_text : String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
    
    var h_textColor : UIColor {
        get {
            return textColor ?? Black
        }
        set {
            textColor = newValue
        }
    }
    
    var h_font : UIFont {
        get {
            return font!
        }
        set {
            font = newValue
        }
    }
    
    var h_textAlignment : NSTextAlignment {
        get {
            return textAlignment
        }
        set {
            textAlignment = newValue
        }
    }
}

