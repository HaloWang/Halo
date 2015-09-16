
import UIKit

extension Double : Halo.CGFloatable {
	public var f : CGFloat {
		return CGFloat(self)
	}
}
