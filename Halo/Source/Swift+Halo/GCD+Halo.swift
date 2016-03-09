
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
延迟若干秒后，在主线程执行

- parameter second: 多少秒
- parameter queue:  执行线程，默认为主线程
- parameter block:  做什么
*/
public func After(second second : Double, queue:dispatch_queue_t = dispatch_get_main_queue(), _ block:()->Void) {
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(second * Double(NSEC_PER_SEC)))
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

/**
 仅仅是为了快速调用 after
 */
@warn_unused_result
public func After(second second : Double) { }

