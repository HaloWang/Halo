
import Foundation

public extension String {
    
	/// NSURL(string: self)!
	var URL : NSURL {
        if let URL = NSURL(string: self) {
            return URL
        } else {
            ccLogWarning(self, "is not a url!")
            return NSURL(string: "https://github.com/HaloWang")!
        }
	}
    
    /// self as NSString
    var NS : NSString {
        return self as NSString
    }
	
	/// whether this String is all space or isEmoy
	var isAllSpace : Bool {
		return Array(characters).filter{ $0 == " " }.count == characters.count
	}
}

