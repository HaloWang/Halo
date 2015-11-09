
import UIKit

private class FangYuan {
    
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

private extension CGRect {
    
    var x: CGFloat {
        get {
            return origin.x
        }
        set {
            origin.x = newValue
        }
    }
    var y: CGFloat {
        get {
            return origin.y
        }
        set {
            origin.y = newValue
        }
    }
    var width: CGFloat {
        get {
            return size.width
        }
        set {
            size.width = newValue
        }
    }
    var height: CGFloat {
        get {
            return size.height
        }
        set {
            size.height = newValue
        }
    }
    var chainRight: CGFloat {
        return x + width
    }
    var chainBottom: CGFloat {
        return y + height
    }
    
}

private var X: Int8 = 0
private var Y: Int8 = 0

public extension UIView {
    
    private var fangYuanX: FangYuan {
        if objc_getAssociatedObject(self, &X) == nil {
            objc_setAssociatedObject(self, &X, FangYuan(), .OBJC_ASSOCIATION_RETAIN)
        }
        return objc_getAssociatedObject(self, &X) as! FangYuan
    }
    private var fangYuanY: FangYuan {
        if objc_getAssociatedObject(self, &Y) == nil {
            objc_setAssociatedObject(self, &Y, FangYuan(), .OBJC_ASSOCIATION_RETAIN)
        }
        return objc_getAssociatedObject(self, &Y) as! FangYuan
    }
    
    func x(x:CGFloat) -> Self {
        self.x = x
        return self
    }
    
    func y(y:CGFloat) -> Self {
        self.y = y
        return self
    }
    
    func left(left:CGFloat) -> Self {
        self.left = left
        return self
    }
    
    func right(right:CGFloat) -> Self {
        self.right = right
        return self
    }
    
    func top(top:CGFloat) -> Self {
        self.top = top
        return self
    }
    
    func bottom(bottom:CGFloat) -> Self {
        self.bottom = bottom
        return self
    }
    
    func height(height:CGFloat) -> Self {
        self.height = height
        return self
    }
    
    func width(width:CGFloat) -> Self {
        self.width = width
        return self
    }
    
    func size(size:CGSize) -> Self {
        self.size = size
        return self
    }
    
    func size(width width: CGFloat, height:CGFloat) -> Self {
        return self.size(CGSize(width: width, height: height))
    }
    
    func origin(origin:CGPoint) -> Self {
        self.origin = origin
        return self
    }
    
    func origin(x x:CGFloat, y:CGFloat) -> Self {
        return self.origin(CGPoint(x: x, y: y))
    }
    
    func center(center:CGPoint) -> Self {
        self.center = center
        return self
    }
    
    private var hasNoSuperView : Bool {
        let noSuperView = superview == nil
        if  noSuperView {
            tellHasNoSuperView()
        }
        return noSuperView
    }
    
    private func tellHasNoSuperView() {
        print("⚠️FangYuan: You must set superView before use FangYuan!")
    }
    
    private var x: CGFloat {
        get {
            return frame.x
        }
        set {
            if hasNoSuperView {
                return
            }
            frame.x = newValue
            fangYuanX.x = newValue
            if fangYuanX.z != nil {
                frame.width = superview!.width - x - fangYuanX.z!
            }
        }
    }
    
    var left: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    var chainLeft : CGFloat {
        if hasNoSuperView {
            return 0
        }
        return superview!.width - left
    }
    
    var width: CGFloat {
        get {
            return frame.width
        }
        set {
            if hasNoSuperView {
                return
            }
            frame.width = newValue
            fangYuanX.y = newValue
            if fangYuanX.z != nil {
                frame.x = superview!.width - width - fangYuanX.z!
            }
        }
    }
    
    var right: CGFloat {
        get {
            if hasNoSuperView {
                return 0
            }
            return superview!.width - chainRight
        }
        set {
            if hasNoSuperView {
                return
            }
            fangYuanX.z = newValue
            if fangYuanX.x != nil {
                frame.width = superview!.width - x - fangYuanX.z!
            } else {
                frame.x = superview!.width - width - fangYuanX.z!
            }
        }
    }
    
    var chainRight: CGFloat {
        return x + width
    }
    
    private var y: CGFloat {
        get {
            return frame.y
        }
        set {
            if hasNoSuperView {
                return
            }
            frame.y = newValue
            fangYuanY.x = newValue
            if fangYuanY.z != nil {
                frame.height = superview!.height - y - fangYuanY.z!
            }
        }
    }
    
    var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.height
        }
        set {
            if hasNoSuperView {
                return
            }
            frame.height = newValue
            fangYuanY.y = newValue
            if fangYuanY.z != nil {
                frame.y = superview!.height - height - fangYuanY.z!
            }
        }
    }
    
    var bottom: CGFloat {
        get {
            if hasNoSuperView {
                return 0
            }
            return superview!.height - chainBottom
        }
        set {
            if hasNoSuperView {
                return
            }
            fangYuanY.z = newValue
            if fangYuanY.x != nil {
                frame.height = superview!.height - y - fangYuanY.z!
            } else {
                frame.y = superview!.height - height - fangYuanY.z!
            }
        }
    }
    
    var chainBottom: CGFloat {
        return y + height
    }
    
    var chainTop : CGFloat {
        if hasNoSuperView {
            return 0
        }
        return superview!.height - y
    }
    
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            x = newValue.x
            y = newValue.y
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    var reOrigin: CGPoint {
        get {
            return CGPoint(x: right, y: bottom)
        }
        set {
            right = newValue.x
            bottom = newValue.y
        }
    }
    
    func centerVertically() -> Self {
        if hasNoSuperView {
            return self
        }
        y = ((superview!.height - height)/2)
        return self
    }
    
    func centerHorizontally() -> Self {
        if hasNoSuperView {
            return self
        }
        x = ((superview!.width - width)/2)
        return self
    }
}



