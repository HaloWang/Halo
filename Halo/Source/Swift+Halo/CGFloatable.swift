
import CoreGraphics

//  Such code will make compiler crazy!!!
//  let height = ((ScreenHeight - 64 - 44 - WCKeyboardObserver.currentKeyboardHeight) / 55) * 55.f


/**
*  对 Int/Float/Double 的一个拓展，方便将数据展现在视图上
*/
public protocol CGFloatable {
    /// 一个 CGFloat 值
    var f: CGFloat { get }
}

extension CGFloat : Halo.CGFloatable {
    public var f: CGFloat {
        return self
    }
}

extension Double : Halo.CGFloatable {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension Float : Halo.CGFloatable {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension Int : Halo.CGFloatable {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

public extension CGSize {
    init(width: Halo.CGFloatable, height: Halo.CGFloatable) {
        self.width = width.f
        self.height = height.f
    }
}

public extension CGPoint {
    init(x: Halo.CGFloatable, y: Halo.CGFloatable) {
        self.x = x.f
        self.y = y.f
    }
}

public extension CGRect {
    init(x: Halo.CGFloatable, y: Halo.CGFloatable, width: Halo.CGFloatable, height: Halo.CGFloatable) {
        self.origin = CGPoint(x: x, y: y)
        self.size = CGSize(width: width, height: height)
    }
}

public func *(lhs: Halo.CGFloatable, rhs: Halo.CGFloatable) -> CGFloat {
    return lhs.f * rhs.f
}

public func -(lhs: Halo.CGFloatable, rhs: Halo.CGFloatable) -> CGFloat {
    return lhs.f - rhs.f
}

public func +(lhs: Halo.CGFloatable, rhs: Halo.CGFloatable) -> CGFloat {
    return lhs.f + rhs.f
}

public func /(lhs: Halo.CGFloatable, rhs: Halo.CGFloatable) -> CGFloat {
    return lhs.f / rhs.f
}

public extension CGFloatable {

    /// 返回一个宽和高都为自己的值
    public var size: CGSize {
        return CGSize(width: f, height: f)
    }

    /// 返回一个宽和高都为自己的值
    public var square: CGSize {
        return size
    }
    /// 返回一个x和y都为自己的值
    public var origin: CGPoint {
        return CGPoint(x: f, y: f)
    }

    /// 很多时候需要设置 ×2 的属性
    public var double: CGFloat {
        return self * 2
    }
}
