
import UIKit

public extension UITextField {
	
    func placeholder(placeholder : String) -> Self{
		self.placeholder = placeholder
		return self
	}
	
    func leftWidth(leftWidth : CGFloat) -> Self {
		leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftWidth, height: 5))
		leftViewMode = UITextFieldViewMode.Always
		return self
	}
	
    func keyboardType(keyboardType : UIKeyboardType) -> Self {
		self.keyboardType = keyboardType
		return self
	}
	
    func secureTextEntry(secureTextEntry : Bool) -> Self {
		self.secureTextEntry = secureTextEntry
		return self
	}
    
    func returnKeyType(returnKeyType: UIReturnKeyType) -> Self {
        self.returnKeyType = returnKeyType
        return self
    }
    
    func delegate(delegate:UITextFieldDelegate) -> Self {
        self.delegate = delegate
        return self
    }
}

extension UITextField : HasText {
    
    public var h_text : String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
    
    public var h_textColor : UIColor {
        get {
            return textColor ?? Black
        }
        set {
            textColor = newValue
        }
    }
    
    public var h_font : UIFont {
        get {
            return font!
        }
        set {
            font = newValue
        }
    }
    
    public var h_textAlignment : NSTextAlignment {
        get {
            return textAlignment
        }
        set {
            textAlignment = newValue
        }
    }
}

