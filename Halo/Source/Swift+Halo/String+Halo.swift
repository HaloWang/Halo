
import Foundation

public extension String {
	var URL : NSURL {
        if let URL = NSURL(string: self) {
            return URL
        } else {
            ccLogWarning(self, "is not a url!")
            return NSURL(string: "https://github.com/HaloWang")!
        }
	}
	
	func stringAppend(s:String) -> String {
		var str = self
		str.appendContentsOf(s)
		return str
	}
	
	/// whether this String is all space
	/**
	- ""
	- " "
	- "   "
	...
	*/
	var isAllSpace : Bool {
		return Array(characters).filter{ $0 == " " }.count == characters.count
	}
}

