//
//  UITableView+Halo.swift
//  Halo
//
//  Created by 王策 on 15/9/7.
//  Copyright (c) 2015年 WangCe. All rights reserved.
//

import UIKit

public extension UITableView {
    func dataSourceAndDelegate(dataSourceAndDelegate: protocol<UITableViewDataSource, UITableViewDelegate>) -> Self {
        delegate = dataSourceAndDelegate
        dataSource = dataSourceAndDelegate
        return self
    }
    
    func register(#cellClass: AnyClass, reuseIdentifier: String) -> Self {
        registerClass(cellClass, forCellReuseIdentifier: reuseIdentifier)
        return self
    }
    
    func rowHeight(rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    func separatorColor(separatorColor: UIColor) -> Self {
        self.separatorColor = separatorColor
        return self
    }
    
}
