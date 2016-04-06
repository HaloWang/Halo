
import UIKit
import Halo

// MARK: - Properties & Init
class ViewController: UIViewController {
    let v = UIView()
}

// MARK: - Lifecycle
extension ViewController {
    
    override func loadView() {
        super.loadView()
        
        v
            .superView(view)
            .backgroundColor(Red)
            .cornerRadius(5, borderWidth: 1, borderColor: Red.alpha(0.5))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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