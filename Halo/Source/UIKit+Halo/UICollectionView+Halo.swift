//
//  UICollectionView+Halo.swift
//  Halo
//
//  Created by 王策 on 15/10/24.
//  Copyright © 2015年 WangCe. All rights reserved.
//

import UIKit

public extension UICollectionView {
    /// 为 UITableView 绑定某种类型的 UITableViewCell
    func registerCellClass<T:UICollectionViewCell>(cellClass:T.Type) -> Self {
        registerClass(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
        return self
    }
    /// 取某种类型的 UITableViewCell
    func dequeueCell<T:UICollectionViewCell>(cell: T.Type, indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
}
