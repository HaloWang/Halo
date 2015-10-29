
import UIKit

public extension UITextView {
    
    func returnKeyType(returnKeyType : UIReturnKeyType) -> Self {
		self.returnKeyType = returnKeyType
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
	
    func editable(editable : Bool) -> Self {
		self.editable = editable
		return self
	}
	
    func selectable(selectable : Bool) -> Self {
		self.selectable = selectable
		return self
	}
	
    func textContainerInset(textContainerInset : UIEdgeInsets) -> Self {
		self.textContainerInset = textContainerInset
		return self
	}
}

extension UITextView : HasText {
    
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
            return font ?? UIFont.systemFontOfSize(12)
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
