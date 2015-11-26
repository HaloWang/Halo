
import UIKit

public extension UIScrollView {
	
    var offsetX : CGFloat {
		get {
			return contentOffset.x
		}
		set {
			contentOffset.x = newValue
		}
	}
	
	var offsetY : CGFloat {
		get {
			return contentOffset.y
		}
		set {
			contentOffset.y = newValue
		}
	}
    
    var contentSizeHeight : CGFloat  {
        get {
            return contentSize.height
        }
        set {
            contentSize.height = newValue
        }
    }
    
    var contentSizeWidth : CGFloat {
        get {
            return contentSize.width
        }
        set {
            contentSize.width = newValue
        }
    }
	
	var insetTop : CGFloat {
		get {
			return contentInset.top
		}
		set {
			contentInset.top = newValue
			scrollIndicatorInsets.top = newValue
		}
	}
	
	var insetBottom : CGFloat {
		get {
			return contentInset.bottom
		}
		set {
			contentInset.bottom = newValue
			scrollIndicatorInsets.bottom = newValue
		}
	}
    
    func delegate(delegate: UIScrollViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    
    func contentInsetTop(top:CGFloat) -> Self {
        insetTop = top
        return self
    }
    
    func contentInsetBottom(bottom:CGFloat) -> Self {
        insetBottom = bottom
        return self
    }
    
    func contentInsetLeft(left:CGFloat) -> Self {
        self.contentInset.left = left
        return self
    }
    
    func contentInsetRight(right:CGFloat) -> Self {
        self.contentInset.right = right
        return self
    }
	
	func insetBottom(bottom : CGFloat) -> Self {
		insetBottom = bottom
		scrollIndicatorInsets.bottom = bottom
		return self
	}
	
	func offsetX(offsetX:CGFloat) -> Self {
		self.offsetX = offsetX
		return self
	}
	
	func offsetY(offsetY : CGFloat) -> Self {
		self.offsetY = offsetY
		return self
	}
	
	func insetTop(top : CGFloat) -> Self {
		insetTop = top
		scrollIndicatorInsets.top = top
		return self
	}
	
	func bounces(bounces : Bool) -> Self {
		self.bounces = bounces
		return self
	}
	
	func contentSize(size : CGSize) -> Self {
		contentSize = size
		return self
	}
    
    func contentSize(width:CGFloat, height:CGFloat) -> Self {
        contentSize = CGSize(width: width, height: height)
        return self
    }
	
	func contentInset(contentInset : UIEdgeInsets) -> Self {
		self.contentInset = contentInset
		return self
	}
	
	func scrollIndicatorInsets(scrollIndicatorInsets : UIEdgeInsets) -> Self {
		self.scrollIndicatorInsets = scrollIndicatorInsets
		return self
	}
	
	func contentOffset(contentOffset : CGPoint) -> Self {
		self.contentOffset = contentOffset
		return self
	}
	
	func alwaysBounceVertical(alwaysBounceVertical : Bool) -> Self {
		self.alwaysBounceVertical = alwaysBounceVertical
		return self
	}
	
	func scrollEnabled(scrollEnabled : Bool) -> Self {
		self.scrollEnabled = scrollEnabled
		return self
	}
	
	func pagingEnabled(pagingEnabled : Bool) -> Self {
		self.pagingEnabled = pagingEnabled
		return self
	}
	
	func showsVerticalScrollIndicator(showsVerticalScrollIndicator:Bool) -> Self {
		self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
		return self
	}
	
	func showsHorizontalScrollIndicator(showsHorizontalScrollIndicator: Bool) -> Self {
		self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
		return self
	}
	
}

