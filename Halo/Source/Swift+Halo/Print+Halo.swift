
import Foundation

public func cc<T>(item:T) {
	print(item, terminator: "\n")
}

public func ccRight<T>(item:T) {
	print("✅", item, terminator: "\n")
}

public func ccWarning<T>(item:T) {
	print("⚠️", item, terminator: "\n")
}

public func ccError<T>(item:T) {
	print("❌", item, terminator: "\n")
}

public let LogString = "Halo.framework"
