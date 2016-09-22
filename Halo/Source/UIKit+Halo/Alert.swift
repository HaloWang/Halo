
import UIKit

open class Alert {

    var title: String?
    var message: String?

    var style = UIAlertControllerStyle.alert
    var actions = [UIAlertAction]()

    weak var alertController: UIAlertController?

    open class func showIn(_ vc: UIViewController) -> Alert {

        let alert = Alert()

        DispatchQueue.main.async {
            let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: alert.style)
            alert.alertController = alertController
            for action in alert.actions {
                alertController.addAction(action)
            }
            vc.present(alertController, animated: true, completion: nil)
        }

        return alert
    }

    /// Set title
    open func title(_ title: String?) -> Self {
        self.title = title
        return self
    }

    /// Set message
    open func message(_ message: String?) -> Self {
        self.message = message
        return self
    }

    /// Set style
    open func preferredStyle(_ style: UIAlertControllerStyle) -> Self {
        self.style = style
        return self
    }

    /// Add a button
    open func addAction(_ title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> Self {
        let action = UIAlertAction(title: title, style: style) { [weak self] in
            handler?($0)

            self?.alertController?.dismiss(animated: true, completion: nil)
        }
        actions.append(action)
        return self
    }
}
