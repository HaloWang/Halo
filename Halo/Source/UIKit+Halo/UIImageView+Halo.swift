
import UIKit

public extension UIImageView {
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    func image(named: String) -> Self {
        self.image = UIImage(named: named)
        return self
    }
}
