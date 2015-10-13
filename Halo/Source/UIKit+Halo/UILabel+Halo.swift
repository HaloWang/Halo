
import UIKit

// TODO: 应该让 UILabel/UITextField/UITextView 统一遵守某一协议

public extension UILabel {
	
	public func text(text : String?) -> Self {
		self.text = text
		return self
	}
	
	public func textColor(color : UIColor) -> Self {
		self.textColor = color
		return self
	}
	
	public func numberOfLines(numberOfLines : Int) -> Self {
		self.numberOfLines = numberOfLines
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
	
	public func text(text : String, textColor : UIColor) -> Self {
		return self.text(text).textColor(textColor)
	}
	
	/// 获取该 UILabel 展示当前文字所需最小 height，当没有文字时，返回宽度为0，高度为font。lineHeight 的 height
	public var displayHeight: CGFloat {
		if let text = text {
			return (text as NSString).boundingRectWithSize(CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font ?? UIFont.systemFontOfSize(17)], context: nil).size.height
		} else {
			return font?.lineHeight ?? UIFont.systemFontOfSize(17).lineHeight
		}
	}
	
	public func font(systemFontOfSize systemFontOfSize:CGFloat) -> Self {
		return font(UIFont.systemFontOfSize(systemFontOfSize))
	}
	
}

public extension UIFont {
	static var systemFontName : String {
		return UIFont.systemFontOfSize(12).fontName
	}
}
