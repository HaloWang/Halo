
import UIKit

public extension UITextView {
    
	public func returnKeyType(returnKeyType : UIReturnKeyType) -> Self {
		self.returnKeyType = returnKeyType
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
	
	public func editable(editable : Bool) -> Self {
		self.editable = editable
		return self
	}
	
	public func selectable(selectable : Bool) -> Self {
		self.selectable = selectable
		return self
	}
	
	public func textContainerInset(textContainerInset : UIEdgeInsets) -> Self {
		self.textContainerInset = textContainerInset
		return self
	}
}

extension UITextView : HasText {
    
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
            return font ?? UIFont.systemFontOfSize(12)
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
