
public extension DateFormatter {
    /// 直接使用 dateFormat 初始化一个 NSDateFormatter
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

public extension Int {

    /// 直接转化成 NSDate
    var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }

    /// 除以 1000 后转化成 NSDate
    ///
    /// 从 Java 服务器获取的时间戳通常要除以1000
    var dateDivideByAThousand: Date {
        return Date(timeIntervalSince1970: TimeInterval(self / 1000))
    }
}
