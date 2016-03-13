//
//  UIView+FangYuan.swift
//  Halo
//
//  Created by 王策 on 15/11/12.
//  Copyright © 2015年 WangCe. All rights reserved.
//

import Foundation

private var X : Any?
private var Y : Any?

// MARK: - Chainable getter
public extension UIView {
    var chainLeft : CGFloat {
        if hasNoSuperView {
            return 0
        }
        return superview!.width - left
    }
    
    var chainRight: CGFloat {
        return left + width
    }
    
    var chainBottom: CGFloat {
        return top + height
    }
    
    var chainTop : CGFloat {
        if hasNoSuperView {
            return 0
        }
        return superview!.height - top
    }
}

// MARK: - Chainable setMethods

//public enum FangYuanDimension {
//    case Left(CGFloatable)
//    case Right(CGFloatable)
//    case Top(CGFloatable)
//    case Bottom(CGFloatable)
//    case Width(CGFloatable)
//    case Height(CGFloatable)
//}
//
//infix operator |> {
//    associativity left
//}
//
//public func |><T:UIView>(view:T, dimension:Halo.FangYuanDimension) -> T {
//    switch dimension {
//    case .Left(let value):
//        return view.left(value.f)
//    case .Right(let value):
//        return view.right(value.f)
//    case .Top(let value):
//        return view.top(value.f)
//    case .Bottom(let value):
//        return view.bottom(value.f)
//    case .Width(let value):
//        return view.width(value.f)
//    case  .Height(let value):
//        return view.height(value.f)
//    }
//}

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
    
    func edge(edge:UIEdgeInsets) -> Self {
        top    = edge.top
        bottom = edge.bottom
        left   = edge.left
        right  = edge.right
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
    
    private(set) var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
            if hasNoSuperView {
                return
            }
            fangYuanX.x = newValue
            if fangYuanX.z != nil {
                frame.size.width = superview!.width - left - fangYuanX.z!
            }
        }
    }
    
    private(set) var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
            if hasNoSuperView {
                return
            }
            fangYuanX.y = newValue
            if fangYuanX.z != nil {
                frame.origin.x = superview!.width - width - fangYuanX.z!
            }
        }
    }
    
    private(set) var right: CGFloat {
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
                frame.size.width = superview!.width - left - fangYuanX.z!
            } else {
                frame.origin.x = superview!.width - width - fangYuanX.z!
            }
        }
    }
    
    private(set) var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
            if hasNoSuperView {
                return
            }
            fangYuanY.x = newValue
            if fangYuanY.z != nil {
                frame.size.height = superview!.height - top - fangYuanY.z!
            }
        }
    }
    
    private(set) var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
            if hasNoSuperView {
                return
            }
            fangYuanY.y = newValue
            if fangYuanY.z != nil {
                frame.origin.y = superview!.height - height - fangYuanY.z!
            }
        }
    }
    
    private(set) var bottom: CGFloat {
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
                frame.size.height = superview!.height - top - fangYuanY.z!
            } else {
                frame.origin.y = superview!.height - height - fangYuanY.z!
            }
        }
    }
    
    private(set) var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            left = newValue.x
            top = newValue.y
        }
    }
    
    private(set) var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    private(set) var reOrigin: CGPoint {
        get {
            return CGPoint(x: right, y: bottom)
        }
        set {
            right = newValue.x
            bottom = newValue.y
        }
    }
    
    
}
