//
//  UITableViewCell+Halo.swift
//  Halo
//
//  Created by 王策 on 15/9/7.
//  Copyright (c) 2015年 WangCe. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    public func selectionStyle(selectionStyle:UITableViewCellSelectionStyle) -> Self {
        self.selectionStyle = selectionStyle
        return self
    }
}
