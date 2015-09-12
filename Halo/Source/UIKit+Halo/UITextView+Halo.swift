
import UIKit

public extension UITextView {
	
	public func returnKeyType(returnKeyType : UIReturnKeyType) -> Self {
		self.returnKeyType = returnKeyType
		return self
	}
	
	public func font(font : UIFont) -> Self {
		self.font = font
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
	
	public func textColor(color:UIColor) -> Self {
		self.textColor = color
		return self
	}
	
	public func text(text : String?) -> Self {
		self.text = text
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
