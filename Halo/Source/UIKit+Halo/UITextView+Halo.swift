
import UIKit

public extension UITextView {
    
    /// 获取该 UITextView 展示当前文字所需最小 height，当没有文字时，返回宽度为0，高度为font。lineHeight 的 height
    public var displayHeight: CGFloat {
        if let text = text {
            return (text as NSString).boundingRectWithSize(CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font ?? UIFont.systemFontOfSize(12)], context: nil).size.height
        } else {
            return font?.lineHeight ?? UIFont.systemFontOfSize(12).lineHeight
        }
    }
	
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
	
	public func text(text: String? , textColor: UIColor) -> Self {
		return self.text(text).textColor(textColor)
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
