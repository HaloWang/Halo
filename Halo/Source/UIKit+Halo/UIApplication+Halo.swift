//
//  UIApplication+Halo.swift
//  Halo
//
//  Created by 王策 on 15/9/7.
//  Copyright (c) 2015年 WangCe. All rights reserved.
//

import UIKit

public var ScreenBounds : CGRect {
    return UIScreen.mainScreen().bounds
}

public var ScreenHeight : CGFloat {
    return ScreenBounds.size.height
}

public var ScreenWidth : CGFloat {
    return ScreenBounds.size.width
}

public func CM(#y: CGFloat, #width: CGFloat, #height: CGFloat) -> CGRect {
    return CGRect(x: (ScreenWidth - width)/2, y: y, width: width, height: height)
}

public var CurrentSystemVersion : Float {
    return (UIDevice.currentDevice().systemVersion as NSString).floatValue
}

public func SetStatusBarStyle(style : UIStatusBarStyle, #animated: Bool) {
    UIApplication.sharedApplication().setStatusBarStyle(style, animated: animated)
}