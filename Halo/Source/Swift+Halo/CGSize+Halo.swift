
import UIKit

public extension CGSize {
	public func scaleTo(scale:CGFloat) -> CGSize {
		return CGSize(width: width*scale, height: height*scale)
	}
}
