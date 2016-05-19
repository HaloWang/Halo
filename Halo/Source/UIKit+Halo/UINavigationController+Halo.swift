
import UIKit

public extension UINavigationController {

    /**
     设置 navigationBar 为纯色

     - parameter color:       要设置的纯色
     - parameter tintColor:   tintColor，默认为白色
     - parameter shadowColor: shadowColor，默认为要设置的纯色
     */
    func barUseColor(color: UIColor, tintColor: UIColor = UIColor.whiteColor(), shadowColor: UIColor? = nil) -> Self {
        //	1×1图片画布
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        //	获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        //	画方形
        CGContextAddRect(ctx, CGRect(x: 0, y: 0, width: 1, height: 1))
        //	给方形填充颜色
        CGContextSetFillColorWithColor(ctx, color.CGColor)
        //	绘制方形
        CGContextFillPath(ctx)
        //	将当前上下文以image形式输出
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //	停止绘制图片
        UIGraphicsEndImageContext()

        navigationBar.setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default)
        navigationBar.tintColor = tintColor
        var newAttributes = navigationBar.titleTextAttributes ?? Dictionary()
        newAttributes[NSForegroundColorAttributeName] = tintColor
        navigationBar.titleTextAttributes = newAttributes

        if let shadowColor = shadowColor {
            navigationBar.shadowImage = UIImage.imageWithColor(shadowColor)
        } else {
            navigationBar.shadowImage = image
        }

        return self

    }
}
