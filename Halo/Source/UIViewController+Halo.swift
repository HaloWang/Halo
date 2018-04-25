
import UIKit

public extension UIViewController {

    /// navigationController?.pushViewController(vc, animated: animated)
    func push(_ vc: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }

    func rightBarButtonItemTitle(_ title: String?, targetSelfAction action: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: action)
    }

    func leftBarButtonItemTitle(_ title: String?, targetSelfAction action: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: action)
    }

    @discardableResult
    func hidesBottomBarWhenPushed(_ hidesBottomBarWhenPushed: Bool) -> Self {
        self.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        return self
    }

	/**
	直接设置 self.view.backgroundColor

	- parameter backgroundColor: 背景颜色

	- returns: self
	*/
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> Self {
		_ = view.backgroundColor(backgroundColor)
		return self
	}
	/**
	在 self.view 上添加 UIView

	- parameter viewsSubview: subView

	- returns: self
	*/
    @discardableResult
    func addSubview(_ subviewForView: UIView) -> Self {
		view.addSubview(subviewForView)
		return self
	}

    @discardableResult
    func addSubviews(_ subviewsForView: [UIView]) -> Self {
        view.addSubviews(subviewsForView)
        return self
    }

    @discardableResult
    func title(_ title: String?) -> Self {
		self.title = title
		return self
	}

	//  设置成true的话，表示即便UIViewController的navigationBar是不透明的，也会将 view 上的 scrollView 的 frame 拓展到 navigationBar 下面。这样就使 scrollView.frame 在拥有透明或非透明的 navigationBar 中表现一致了。
	//  不过，这也许不是一个好办法。
    @discardableResult
    func extendedLayoutIncludesOpaqueBars(_ extendedLayoutIncludesOpaqueBars: Bool) -> Self {
		self.extendedLayoutIncludesOpaqueBars = extendedLayoutIncludesOpaqueBars
		return self
	}

    @discardableResult
    func automaticallyAdjustsScrollViewInsets(_ automaticallyAdjustsScrollViewInsets: Bool) -> Self {
		self.automaticallyAdjustsScrollViewInsets = automaticallyAdjustsScrollViewInsets
		return self
	}

    var navigationed: UINavigationController {
        return UINavigationController(rootViewController: self)
    }

}
