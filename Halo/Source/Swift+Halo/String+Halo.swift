
import Foundation

public extension String {
	public var URL : NSURL {
        if let URL = NSURL(string: self) {
            return URL
        } else {
            println("⚠️Halo.framework: \(self) is not a url!")
            return NSURL(string: "https://github.com/HaloWang")!
        }
	}
}