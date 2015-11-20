
import Foundation

/**
开启新线程，异步执行

- parameter block: 做什么
*/
public func Async(block:() -> Void) {
    let queue = dispatch_queue_create(LogString + ".Async", nil)
    dispatch_async(queue, block)
}

/**
延迟执行

- parameter second: 多少秒
- parameter block:  做什么
*/
public func After(second second : Double, _ block:()->Void) {
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(second * Double(NSEC_PER_SEC)))
    let queue = dispatch_get_main_queue()
	dispatch_after(when, queue, block)
}

/**
最后执行某事，不阻碍 UI，在主线程中执行

- parameter block: 做什么
*/
public func Last(block:() -> Void) {
    let queue = dispatch_get_main_queue()
    dispatch_async(queue, block)
}
