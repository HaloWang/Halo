
import UIKit

public extension UITableView {
    
    func separatorStyle(separatorStyle:UITableViewCellSeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
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
    
    //  受 http://blog.callmewhy.com/2015/10/21/extension-in-yoapp/ 启发
    
    /// 为 UITableView 绑定某种类型的 UITableViewCell
    func registerCellClass<T:UITableViewCell>(cellClass:T.Type) -> Self {
        registerClass(cellClass, forCellReuseIdentifier: cellClass.halo_reuseIdentifier)
        return self
    }
    
    /// 取某种类型的 UITableViewCell
    func dequeueCell<T:UITableViewCell>(cell: T.Type) -> T {
        return dequeueReusableCellWithIdentifier(cell.halo_reuseIdentifier) as! T
    }
    
    /// 同时设置 dataSource 和 delegate
    func dataSourceAndDelegate(dataSourceAndDelegate:protocol<UITableViewDelegate, UITableViewDataSource>?) -> Self {
        self.dataSource = dataSourceAndDelegate
        (self as UITableView).delegate = dataSourceAndDelegate
        return self
    }
    
    var dataSourceAndDelegate : protocol<UITableViewDelegate, UITableViewDataSource>? {
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
                return dataSource as? protocol<UITableViewDelegate, UITableViewDataSource>
            } else {
                ccLogWarning("DataSource is \(dataSource)\n", "Delegate is \(delegate)\n", "They are different")
                return nil
            }
            
        }
        set {
            self.dataSource = newValue
            (self as UITableView).delegate = newValue
        }
    }
}

extension UITableViewCell {
    /// 返回 "Halo.ReuseIdentifier.YOUR_CLASS_NAME"
    static var halo_reuseIdentifier : String {
        return "Halo.ReuseIdentifier." + NSStringFromClass(self)
    }
}
