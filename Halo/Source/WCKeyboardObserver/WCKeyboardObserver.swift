

import UIKit

@objc public protocol WCKeyboardObserverDelegate : NSObjectProtocol {
	/**
	键盘在屏幕上展示的高度即将改变
	
	:param: height   键盘在屏幕上的显示高度
	:param: duration 键盘动画延时
	*/
	func keyboardWillChangeToHeight(height:CGFloat, duration:NSTimeInterval)
}

public class WCKeyboardObserver: NSObject {
	
	private static let sharedInstance = WCKeyboardObserver()
	
	/// set delegate
	public static var delegate : WCKeyboardObserverDelegate? {
		get {
			return self.sharedInstance.delegate
		}
		set {
			self.sharedInstance.delegate = newValue
		}
	}
	
	/// 当前键盘显示高度
	public static var currentKeyboardHeight : CGFloat {
		return self.sharedInstance.currentKeyboardHeight
	}
	
	/// 当前键盘显示高度
	private var currentKeyboardHeight : CGFloat	= 0
	
	private weak var delegate : WCKeyboardObserverDelegate?

	private override init() {
		super.init()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardFrameChange:", name: UIKeyboardWillChangeFrameNotification, object: nil)
	}
	
	func keyboardFrameChange(notification : NSNotification) {
		if let userInfo = notification.userInfo,
			let keyboardY = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().origin.y,
			let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
				let screenHeight = UIScreen.mainScreen().bounds.size.height
				currentKeyboardHeight = screenHeight - keyboardY
				delegate?.keyboardWillChangeToHeight(currentKeyboardHeight, duration: duration)
		}
	}
	
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillChangeFrameNotification, object: nil)
	}
}
