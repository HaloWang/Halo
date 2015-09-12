
import UIKit

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
	
	/// 获取该label展示当前文字所需最小size，当没有文字时，返回宽度为0，高度为font。lineHeight的size
	public var displaySize: CGSize {
		if let text = text {
			return (text as NSString).boundingRectWithSize(CGSize(width: Double(MAXFLOAT), height: Double(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil).size
		} else {
			return CGSize(width: 0, height: font.lineHeight)
		}
	}
	
	public func font(#systemFontOfSize:CGFloat) -> Self {
		return font(UIFont.systemFontOfSize(systemFontOfSize))
	}
	
}
