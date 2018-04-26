
import Foundation

public extension String {

	/// NSURL(string: self)!
    ///
    /// 如果含有汉字，会使用 stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
	var URL: Foundation.URL {
        if let URL = Foundation.URL(string: self) {
            return URL
        } else if let URL = Foundation.URL(string: NS.addingPercentEscapes(using: String.Encoding.utf8.rawValue)!) {
            return URL
        } else {
            ccLogWarning(self, "is not a url!")
            ccLogWarning(self, "Can not use NSUTF8StringEncoding")
            return Foundation.URL(string: "http://www.google.com")!
        }
	}

    /// self as NSString
    var NS: NSString {
        return self as NSString
    }
}

public extension Int {
    /// return String(self)
    var string: String {
        return String(self)
    }
}

public extension Double {
    /// return String(self)
    var string: String {
        return String(self)
    }
}
