
import UIKit

public extension UITableView {
	
    func register(cellClass cellClass: AnyClass, reuseIdentifier: String) -> Self {
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
    
    //  受 http://blog.callmewhy.com/2015/10/21/extension-in-yoapp/ 启发
    
    /// 为 UITableView 绑定某种类型的 UITableViewCell
    func registerCellClass<T:UITableViewCell>(cellClass:T.Type) -> Self {
        registerClass(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
        return self
    }
    
    /// 取某种类型的 UITableViewCell
    func dequeueCell<T:UITableViewCell>(cell: T.Type) -> T {
        return dequeueReusableCellWithIdentifier(T.reuseIdentifier) as! T
    }
    
}
