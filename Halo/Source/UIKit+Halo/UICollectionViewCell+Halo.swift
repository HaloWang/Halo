//
//  UICollectionViewCell+Halo.swift
//  Halo
//
//  Created by 王策 on 15/10/24.
//  Copyright © 2015年 WangCe. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    /// 返回 "Halo.ReuseIdentifier.YOUR_CLASS_NAME"
    static var reuseIdentifier : String {
        return "Halo.ReuseIdentifier." + NSStringFromClass(self)
    }
}
