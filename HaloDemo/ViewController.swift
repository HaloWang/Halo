
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
        
        let originImage = UIImage(named: "Icon")!
        
        ccRight("originImage:\n" , originImage)
        
        let scaledImage = originImage.scaleToWidth(256)
        
        ccRight("scaledImage:\n", scaledImage)
        
        let iv = UIImageView(image: originImage)
            .superView(view)
            .swcm(y: NavigationBarHeight, height: ScreenWidth)
            .contentMode(.Center)
        
        After(second: 2) {
            iv.image(scaledImage)
        }
        
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
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

// MARK: - Methods
extension ViewController {
    
}