
import UIKit

public class Alert {

    var title: String?
    var message: String?

    var style = UIAlertControllerStyle.Alert
    var actions = [UIAlertAction]()

    weak var alertController: UIAlertController?

    public class func showIn(vc: UIViewController) -> Alert {

        let alert = Alert()

        dispatch_async(dispatch_get_main_queue()) {
            let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: alert.style)
            alert.alertController = alertController
            for action in alert.actions {
                alertController.addAction(action)
            }
            vc.presentViewController(alertController, animated: true, completion: nil)
        }

        return alert
    }

    /// Set title
    public func title(title: String?) -> Self {
        self.title = title
        return self
    }

    /// Set message
    public func message(message: String?) -> Self {
        self.message = message
        return self
    }

    /// Set style
    public func preferredStyle(style: UIAlertControllerStyle) -> Self {
        self.style = style
        return self
    }

    /// Add a button
    public func addAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> Self {
        let action = UIAlertAction(title: title, style: style) { [weak self] in
            handler?($0)

            self?.alertController?.dismissViewControllerAnimated(true, completion: nil)
        }
        actions.append(action)
        return self
    }
}
