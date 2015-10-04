//
//  UIImageView+Halo.swift
//  Halo
//
//  Created by 王策 on 15/9/7.
//  Copyright (c) 2015年 WangCe. All rights reserved.
//

import UIKit

public extension UIImageView {
    public func image(image:UIImage?) -> Self {
        self.image = image
        return self
    }
    
    public func image(named named:String) -> Self {
        self.image = UIImage(named: named)
        return self
    }
}
