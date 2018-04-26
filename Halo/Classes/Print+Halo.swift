
import Foundation

internal let LogString = "Halo.framework"

public func cc(_ items: Any...) {
	print(items.halo_stringValue)
}

public func ccInfo(_ items: Any...) {
	print(items.halo_stringValue)
}

// TODO: 到底怎样使用“多参数”呢？

public func ccRight(_ items: Any...) {
	print(items.halo_appendFirst("✅").halo_stringValue)
}

public func ccWarning(_ items: Any...) {
	print(items.halo_appendFirst("⚠️").halo_stringValue)
}

public func ccError(_ items: Any...) {
	print(items.halo_appendFirst("❌").halo_stringValue)
}

func ccLogWarning(_ items: Any...) {
    ccWarning(items.halo_appendFirst(LogString))
}

public func ccType(_ item: Any) {
	print(type(of: (item) as AnyObject))
}

public extension Array {
	// TODO: 不知道还有没有更优雅的方法？
	// TODO: 用 reduce 怎么区分是不是最后一个 Element
	/// 将数组中的每一个元素转化为字符串输出
	var halo_stringValue: String {
		var stringValue = ""
		for i in 0 ..< count {
			stringValue.append("\(self[i])" + ( i == count - 1 ? "" : " "))
		}
		return stringValue
	}
}
