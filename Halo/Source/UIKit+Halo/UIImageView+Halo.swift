
import UIKit

public extension UIImageView {
    func image(image:UIImage?) -> Self {
        self.image = image
        return self
    }
    
    func image(named named:String) -> Self {
        self.image = UIImage(named: named)
        return self
    }
}
