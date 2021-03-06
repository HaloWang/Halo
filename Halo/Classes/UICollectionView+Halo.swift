//
//  UICollectionView+Halo.swift
//  Halo
//
//  Created by 王策 on 15/10/24.
//  Copyright © 2015年 WangCe. All rights reserved.
//

import UIKit

public extension UICollectionView {

    /// 为 UICollectionView 绑定某种类型的 UITableViewCell
    @discardableResult
    func registerCellClass<T: UICollectionViewCell>(_ cellClass: T.Type) -> Self {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
        return self
    }
    /// 取某种类型的 UICollectionViewCell
    @discardableResult
    func dequeueCell<T: UICollectionViewCell>(_ cell: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as! T
    }

    /// 同时设置 dataSource 和 delegate
    @discardableResult
    func dataSourceAndDelegate(_ dataSourceAndDelegate:UICollectionViewDelegate & UICollectionViewDataSource) -> Self {
        dataSource = dataSourceAndDelegate
        (self as UICollectionView).delegate = dataSourceAndDelegate
        return self
    }

    var dataSourceAndDelegate : (UICollectionViewDelegate & UICollectionViewDataSource)? {
        get {
            guard let dataSource = dataSource else {
                ccLogWarning("DataSource is nil")
                return nil
            }

            guard let delegate = delegate else {
                ccLogWarning("Delegate is nil")
                return nil
            }

            if dataSource.isEqual(delegate) {
                return (dataSource as? UICollectionViewDelegate & UICollectionViewDataSource)!
            } else {
                ccLogWarning("DataSource is \(dataSource)\n", "Delegate is \(delegate)\n", "They are different")
                return nil
            }
        }
        set {
            self.dataSource = newValue
            (self as UICollectionView).delegate = newValue
        }
    }
}

extension UICollectionViewCell {
    /// 返回 "Halo.ReuseIdentifier.YOUR_CLASS_NAME"
    static var reuseIdentifier: String {
        return "Halo.ReuseIdentifier." + String(describing: self)
    }
}
