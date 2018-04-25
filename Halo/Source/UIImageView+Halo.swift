
import UIKit

public extension UIImageView {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func image(named: String) -> Self {
        self.image = UIImage(named: named)
        return self
    }
}
