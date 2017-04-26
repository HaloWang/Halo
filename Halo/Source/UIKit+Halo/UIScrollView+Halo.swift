import UIKit

// MARK: - Properties
public extension UIScrollView {
  @discardableResult
  func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
    self.alwaysBounceHorizontal = alwaysBounceHorizontal
    return self
  }
  
  @discardableResult
  func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
    self.alwaysBounceVertical = alwaysBounceVertical
    return self
  }
  
  @discardableResult
  func scrollEnabled(_ scrollEnabled: Bool) -> Self {
    self.isScrollEnabled = scrollEnabled
    return self
  }
  
  @discardableResult
  func pagingEnabled(_ pagingEnabled: Bool) -> Self {
    self.isPagingEnabled = pagingEnabled
    return self
  }
  
  @discardableResult
  func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
    self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
    return self
  }
  
  @discardableResult
  func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
    self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
    return self
  }
  
  @discardableResult
  func delegate(_ delegate: UIScrollViewDelegate) -> Self {
    self.delegate = delegate
    return self
  }
  
  @discardableResult
  func bounces(_ bounces: Bool) -> Self {
    self.bounces = bounces
    return self
  }
}

// MARK: - ContentLayout
public extension UIScrollView {
  
  var offsetX: CGFloat {
    get {
      return contentOffset.x
    }
    set {
      contentOffset.x = newValue
    }
  }
  
  var offsetY: CGFloat {
    get {
      return contentOffset.y
    }
    set {
      contentOffset.y = newValue
    }
  }
  
  var contentSizeHeight: CGFloat {
    get {
      return contentSize.height
    }
    set {
      contentSize.height = newValue
    }
  }
  
  var contentSizeWidth: CGFloat {
    get {
      return contentSize.width
    }
    set {
      contentSize.width = newValue
    }
  }
  
  fileprivate(set) var insetTop: CGFloat {
    get {
      return contentInset.top
    }
    set {
      contentInset.top = newValue
    }
  }
  
  fileprivate(set) var insetBottom: CGFloat {
    get {
      return contentInset.bottom
    }
    set {
      contentInset.bottom = newValue
    }
  }
  
  
  @discardableResult
  func contentInsetTop(_ top: CGFloat) -> Self {
    contentInset.top = top
    return self
  }
  
  @discardableResult
  func contentInsetBottom(_ bottom: CGFloat) -> Self {
    contentInset.bottom = bottom
    return self
  }
  
  @discardableResult
  func contentInsetLeft(_ left: CGFloat) -> Self {
    contentInset.left = left
    return self
  }
  
  @discardableResult
  func contentInsetRight(_ right: CGFloat) -> Self {
    contentInset.right = right
    return self
  }
  
  func insetBottom(_ bottom: CGFloat) -> Self {
    contentInset.bottom = bottom
    scrollIndicatorInsets.bottom = bottom
    return self
  }
  
  func offsetX(_ offsetX: CGFloat) -> Self {
    contentOffset.x = offsetX
    return self
  }
  
  func offsetY(_ offsetY: CGFloat) -> Self {
    contentOffset.y = offsetY
    return self
  }
  
  func insetTop(_ top: CGFloat) -> Self {
    contentInset.top = top
    scrollIndicatorInsets.top = top
    return self
  }
  
  func contentSize(_ size: CGSize) -> Self {
    contentSize = size
    return self
  }
  
  @discardableResult
  func contentSize(_ width: CGFloat, height: CGFloat) -> Self {
    contentSize = CGSize(width: width, height: height)
    return self
  }
  
  func contentInset(_ contentInset: UIEdgeInsets) -> Self {
    self.contentInset = contentInset
    return self
  }
  
  func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self {
    self.scrollIndicatorInsets = scrollIndicatorInsets
    return self
  }
  
  func contentOffset(_ contentOffset: CGPoint) -> Self {
    self.contentOffset = contentOffset
    return self
  }
  
}

