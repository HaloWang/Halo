
import UIKit

public extension UIViewController {
	
	/**
	直接设置 self.view.backgroundColor
	
	- parameter backgroundColor: 背景颜色
	
	- returns: self
	*/
    func backgroundColor(backgroundColor : UIColor) -> Self{
		view.backgroundColor(backgroundColor)
		return self
	}
	/**
	在 self.view 上添加 UIView
	
	- parameter viewsSubview: subView
	
	- returns: self
	*/
    func addSubview(subviewForView : UIView) -> Self{
		view.addSubview(subviewForView)
		return self
	}
    
    public func addSubviews(subviewsForView : [UIView]) -> Self {
        view.addSubviews(subviewsForView)
        return self
    }
	
    func title(title : String?) -> Self {
		self.title = title
		return self
	}
	
	//  设置成true的话，表示即便UIViewController的navigationBar是不透明的，也会讲view上的scrollView的frame拓展到navigationBar下面。这样就使scrollView.frame在拥有透明或非透明的navigationBar中表现一致了。
	//  不过，这也许不是一个好办法。
    func extendedLayoutIncludesOpaqueBars(extendedLayoutIncludesOpaqueBars : Bool) -> Self {
		self.extendedLayoutIncludesOpaqueBars = extendedLayoutIncludesOpaqueBars
		return self
	}
	
    func automaticallyAdjustsScrollViewInsets(automaticallyAdjustsScrollViewInsets : Bool) -> Self {
		self.automaticallyAdjustsScrollViewInsets = automaticallyAdjustsScrollViewInsets
		return self
	}
    
    var navigationed : UINavigationController {
        return UINavigationController(rootViewController: self)
    }
	
}
