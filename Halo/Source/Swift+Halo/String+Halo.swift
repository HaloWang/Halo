
import Foundation

public extension String {
	public var URL : NSURL {
        if let URL = NSURL(string: self) {
            return URL
        } else {
			ccWarning("\(Halo.LogString): \(self) is not a url!")
            return NSURL(string: "https://github.com/HaloWang")!
        }
	}
}

