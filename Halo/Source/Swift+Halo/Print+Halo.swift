
import Foundation

internal let LogString = "Halo.framework"

public func cc(items:Any...) {
	print(items.halo_stringValue)
}

public func ccInfo(items:Any...) {
	print(items.halo_stringValue)
}

// TODO: 到底怎样使用“多参数”呢？

public func ccRight(items:Any...) {
	print(items.halo_appendFirst("✅").halo_stringValue)
}

public func ccWarning(items:Any...) {
	print(items.halo_appendFirst("⚠️").halo_stringValue)
}

public func ccError(items:Any...) {
	print(items.halo_appendFirst("❌").halo_stringValue)
}

func ccLogWarning(items:Any...) {
    ccWarning(items.halo_appendFirst(LogString))
}

public func ccType(item:Any) {
	print(item.dynamicType)
}

public extension Array {
	// TODO: 不知道还有没有更优雅的方法？
	// TODO: 用 reduce 怎么区分是不是最后一个 Element
	/// 将数组中的每一个元素转化为字符串输出
	var halo_stringValue : String {
		var stringValue = ""
		for i in 0 ..< count {
			stringValue.appendContentsOf("\(self[i])" + ( i == count - 1 ? "" : " "))
		}
		return stringValue
	}
}
