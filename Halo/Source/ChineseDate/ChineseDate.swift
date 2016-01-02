
import Foundation

// TODO: ⚠️ UnFinish!

// TODO: 准确的知道一个 NSDate 应该转成多少天前，多少小时前，多少小时后，多少天后！

private extension NSDate {
    
    private static var parser : NSDateFormatter! = nil
    
    var isToday : Bool {
        return true
    }
    
    var isTomorrow : Bool {
        return true
    }
    
    var isYesterday : Bool {
        return true
    }
    
    var tian : String {
        return "今天"
    }
    
    static func chineseDate(dateString: String, dateFormat:String = "yyyy-MM-dd HH:mm:ss", timezone:NSTimeZone = NSTimeZone(forSecondsFromGMT: 8)) -> NSDate? {
        
        if parser == nil {
            parser = NSDateFormatter()
        }
        
        parser.dateFormat = dateFormat
        parser.timeZone = timezone
        
        return parser.dateFromString(dateString)
    }
}
