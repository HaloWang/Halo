
import UIKit

public extension UINavigationController {
    func barUseColor(color:UIColor, tintColor:UIColor = UIColor.whiteColor()) -> Self {
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
        //	将当前上线文以image形式输出
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //	停止绘制图片
        UIGraphicsEndImageContext()
        
        navigationBar.setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default)
        navigationBar.tintColor = tintColor
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : tintColor]
        navigationBar.shadowImage = image
        
        return self
        
    }
}
