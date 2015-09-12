
import Foundation

/**
最后执行某事，不阻碍 UI
*/
public func Async(block:() -> Void) {
	dispatch_async(dispatch_get_main_queue(), block)
}

/**
延迟执行

:param: second 多少秒
:param: block  做什么
*/
public func After(#second : Double, block:()->Void) {
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(second * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), block)
}
