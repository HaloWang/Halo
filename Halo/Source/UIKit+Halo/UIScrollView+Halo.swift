
import UIKit

public extension UIScrollView {
	
	public var offsetX : CGFloat {
		get {
			return contentOffset.x
		}
		set {
			contentOffset.x = newValue
		}
	}
	
	public var offsetY : CGFloat {
		get {
			return contentOffset.y
		}
		set {
			contentOffset.y = newValue
		}
	}
	
	public var insetTop : CGFloat {
		get {
			return contentInset.top
		}
		set {
			contentInset.top = newValue
			scrollIndicatorInsets.top = newValue
		}
	}
	
	public var insetBottom : CGFloat {
		get {
			return contentInset.bottom
		}
		set {
			contentInset.bottom = newValue
			scrollIndicatorInsets.bottom = newValue
		}
	}
	
	public func insetBottom(bottom : CGFloat) -> Self {
		insetBottom = bottom
		scrollIndicatorInsets.bottom = bottom
		return self
	}
	
	public func offsetX(offsetX:CGFloat) -> Self {
		self.offsetX = offsetX
		return self
	}
	
	public func offsetY(offsetY : CGFloat) -> Self {
		self.offsetY = offsetY
		return self
	}
	
	public func insetTop(top : CGFloat) -> Self {
		insetTop = top
		scrollIndicatorInsets.top = top
		return self
	}
	
	public func bounces(bounces : Bool) -> Self {
		self.bounces = bounces
		return self
	}
	
	public func contentSize(size : CGSize) -> Self {
		contentSize = size
		return self
	}
	
	public func contentInset(contentInset : UIEdgeInsets) -> Self {
		self.contentInset = contentInset
		return self
	}
	
	public func scrollIndicatorInsets(scrollIndicatorInsets : UIEdgeInsets) -> Self {
		self.scrollIndicatorInsets = scrollIndicatorInsets
		return self
	}
	
	public func contentOffset(contentOffset : CGPoint) -> Self {
		self.contentOffset = contentOffset
		return self
	}
	
	public func alwaysBounceVertical(alwaysBounceVertical : Bool) -> Self {
		self.alwaysBounceVertical = alwaysBounceVertical
		return self
	}
	
	public func scrollEnabled(scrollEnabled : Bool) -> Self {
		self.scrollEnabled = scrollEnabled
		return self
	}
	
	public func pagingEnabled(pagingEnabled : Bool) -> Self {
		self.pagingEnabled = pagingEnabled
		return self
	}
	
	public func delegate(delegate : protocol<UIScrollViewDelegate>) -> Self {
		self.delegate = delegate
		return self
	}
	
	public func showsVerticalScrollIndicator(showsVerticalScrollIndicator:Bool) -> Self {
		self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
		return self
	}
	
	public func showsHorizontalScrollIndicator(showsHorizontalScrollIndicator: Bool) -> Self {
		self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
		return self
	}
	
}

