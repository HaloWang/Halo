
import UIKit

public extension UIImageView {
    public func image(image:UIImage?) -> Self {
        self.image = image
        return self
    }
    
    public func image(named named:String) -> Self {
        self.image = UIImage(named: named)
        return self
    }
}
