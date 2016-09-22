

import UIKit

@objc public protocol KeyboardObserverDelegate: NSObjectProtocol {
	/**
	键盘在屏幕上展示的高度即将改变

	- parameter height:   键盘在屏幕上的显示高度
	- parameter duration: 键盘动画延时
	*/
	func keyboardWillChangeToHeight(_ height: CGFloat, duration: TimeInterval)
}

open class KeyboardObserver: NSObject {

	fileprivate static let sharedInstance = KeyboardObserver()

	/// set delegate
	open static var delegate: KeyboardObserverDelegate? {
		get {
			return self.sharedInstance.delegate
		}
		set {
			self.sharedInstance.delegate = newValue
		}
	}

	/// 当前键盘显示高度
	open static var currentKeyboardHeight: CGFloat {
		return self.sharedInstance.currentKeyboardHeight
	}

	/// 当前键盘显示高度
	fileprivate var currentKeyboardHeight: CGFloat	= 0

	fileprivate weak var delegate: KeyboardObserverDelegate?

	fileprivate override init() {
		super.init()
		NotificationCenter.default.addObserver(self, selector: #selector(KeyboardObserver.keyboardFrameChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
	}

	func keyboardFrameChange(_ notification: Notification) {
    
        guard let userInfo = (notification as NSNotification).userInfo else {
            return
        }
        
        guard let keyboardY = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.origin.y else {
            return
        }
        
        guard let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue else {
            return
        }
        
        let screenHeight = UIScreen.main.bounds.size.height
        currentKeyboardHeight = screenHeight - keyboardY
        delegate?.keyboardWillChangeToHeight(currentKeyboardHeight, duration: duration)
	}

	deinit {
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
	}
}
