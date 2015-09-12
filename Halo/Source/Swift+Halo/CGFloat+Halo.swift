
import UIKit

public protocol Halo_CGFloatable {
    var f : CGFloat { get }
}

public extension CGFloat {
	
	public var size : CGSize {
		return CGSize(width: self, height: self)
	}
	
	public var origin : CGPoint {
		return CGPoint(x: self, y: self)
	}
	
	/// 很多时候需要设置 ×2 的属性
	public var double : CGFloat {
		return self * 2
	}
}

extension CGFloat : Halo_CGFloatable {
    public var f : CGFloat {
        return self
    }
}
