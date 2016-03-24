
import CoreGraphics

internal class FangYuan {
    
    enum ConstraintDimension {
        case X
        case Y
        case Z
    }
    
    var last : ConstraintDimension?
    
    var x : CGFloat? {
        didSet {
            guard x != nil else {
                return
            }
            if let last = last {
                if last == .Y {
                    z = nil
                } else if last == .Z {
                    y = nil
                }
            }
            last = .X
        }
    }
    
    var y : CGFloat? {
        didSet {
            guard y != nil else {
                return
            }
            if let last = last {
                if last == .X {
                    z = nil
                } else if last == .Z {
                    x = nil
                }
            }
            last = .Y
        }
    }

    var z : CGFloat? {
        didSet {
            guard z != nil else {
                return
            }
            if let last = last {
                if last == .Y {
                    x = nil
                } else if last == .X {
                    y = nil
                }
            }
            last = .Z
        }
    }
}
