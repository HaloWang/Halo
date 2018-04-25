
import UIKit

public extension UITextView {

    @discardableResult
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self {
		self.returnKeyType = returnKeyType
		return self
	}

    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Self {
		self.keyboardType = keyboardType
		return self
	}

    @discardableResult
    func secureTextEntry(_ secureTextEntry: Bool) -> Self {
		self.isSecureTextEntry = secureTextEntry
		return self
	}

    @discardableResult
    func editable(_ editable: Bool) -> Self {
		self.isEditable = editable
		return self
	}

    @discardableResult
    func selectable(_ selectable: Bool) -> Self {
		self.isSelectable = selectable
		return self
	}

    @discardableResult
    func textContainerInset(_ textContainerInset: UIEdgeInsets) -> Self {
		self.textContainerInset = textContainerInset
		return self
	}
}

extension UITextView : HasText {

    public var h_text: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }

    public var h_textColor: UIColor {
        get {
            return textColor ?? Black
        }
        set {
            textColor = newValue
        }
    }

    public var h_font: UIFont {
        get {
            return font ?? UIFont.systemFont(ofSize: 12)
        }
        set {
            font = newValue
        }
    }

    public var h_textAlignment: NSTextAlignment {
        get {
            return textAlignment
        }
        set {
            textAlignment = newValue
        }
    }
}
