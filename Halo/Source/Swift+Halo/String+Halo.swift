
import Foundation

public extension String {
    
	/// NSURL(string: self)!
    ///
    /// 如果含有汉字，会使用 stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
	var URL : NSURL {
        if let URL = NSURL(string: self) {
            return URL
        } else if let URL = NSURL(string: NS.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!) {
            return URL
        } else {
            ccLogWarning(self, "is not a url!")
            ccLogWarning(self, "Can not use NSUTF8StringEncoding")
            return NSURL(string: "https://github.com/HaloWang")!
        }
	}
    
    /// self as NSString
    var NS : NSString {
        return self as NSString
    }
    
    /// 字符串长度
    var length : Int {
        return characters.count
    }
    
	/// whether this String is all space or isEmoy
	var isAllSpace : Bool {
		return Array(characters).filter{ $0 == " " }.count == characters.count
	}
}

public extension Bool {
    /// return !self
    var NO : Bool {
        return !self
    }
}

public extension Int {
    /// return String(self)
    var string : String {
        return String(self)
    }
}

public extension Double {
    /// return String(self)
    var string : String {
        return String(self)
    }
}
