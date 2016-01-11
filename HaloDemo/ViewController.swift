
import UIKit
import Halo

// MARK: - Properties & Init
class ViewController: UIViewController {
    
}

// MARK: - Lifecycle
extension ViewController {
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        ccRight(date)
        
        let dateFormatter = NSDateFormatter()
        
        ccRight(dateFormatter.dateFormat)
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        ccRight(dateFormatter.timeZone)
        
        ccRight(dateFormatter.stringFromDate(date))

        ccRight(dateFormatter.dateFromString(date.description) ?? "⚠️nil")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - Methods
extension ViewController {
    
}