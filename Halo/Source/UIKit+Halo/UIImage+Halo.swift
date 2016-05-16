
import UIKit
import Accelerate

/// 从 bundle 中按照文件名取图片
public func PNGNamed(name: String) -> UIImage {

	if let imageResourceString = NSBundle.mainBundle().pathForResource(name, ofType: "png"), image = UIImage(contentsOfFile: imageResourceString) {
		return image
	} else {
		print("⚠️Halo.framework: Can not find image named \"\(name).png\" in mainBundle")
		return UIImage()
	}

}

public extension UIImage {

    /**
     将该图片缩放到指定宽度

     - parameter _width: 指定的宽度

     - returns: 已经被所放的 UIImage
     */
    func scaleToWidth(_width: CGFloat) -> UIImage {

        let scaledSize = CGSize(width: _width, height: (height / width) * _width )
        UIGraphicsBeginImageContext(scaledSize)
        drawInRect(CGRect(x: 0, y: 0, width: _width, height: scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }

    // TODO: ⚠️ 该方法还未经过测试！
    private func compressToMaxSize(maxSize: Int) -> UIImage {
        var compression = 0.9.f
        let maxCompression = 0.1.f
        var data = UIImageJPEGRepresentation(self, compression)!
        while data.length > maxSize && compression > maxCompression {
            compression -= 0.1.f
            data = UIImageJPEGRepresentation(self, compression)!
        }
        return UIImage(data: data)!
    }
    
    /// 创建一张图片的纯色图片，经典实用场景是不同颜色的气泡
    ///
    /// 来自于: [JSQMessageViewController](https://github.com/jessesquires/JSQMessagesViewController)
    func hl_mask(color:UIColor) -> UIImage {
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, scale)
        let context = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, 0.0, -imageRect.size.height)
        CGContextClipToMask(context, imageRect, CGImage)
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, imageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 获取一张图片的圆角图片
    ///
    /// 来自于: [JSQMessageViewController](https://github.com/jessesquires/JSQMessagesViewController)
    var hl_circularImage : UIImage {
        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        let imgPath = UIBezierPath(ovalInRect: frame)
        imgPath.addClip()
        drawInRect(frame)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    var pngData: NSData {
		return UIImagePNGRepresentation(self) ?? NSData()
	}

    var jpegData: NSData {
        return UIImageJPEGRepresentation(self, 1) ?? NSData()
    }

    var jpegImage: UIImage? {
        return UIImage(data: jpegData)
    }

    var pngImage: UIImage? {
        return UIImage(data: pngData)
    }

    var width: CGFloat {
		return size.width
	}

    var height: CGFloat {
		return size.height
	}

    class func imageWithColor(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let pureColorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return pureColorImage
    }

    var edgeInsetsToBubble: UIEdgeInsets {
        let center = CGPoint(x: size.width / 2, y: size.height / 2 )
        return UIEdgeInsets(top: center.y, left: center.x, bottom: center.y, right: center.x)
    }

    var resizeableImage: UIImage {
        return resizableImageWithCapInsets(edgeInsetsToBubble, resizingMode: UIImageResizingMode.Stretch)
    }

    /**
     ⚠️ PNG Image can not use this method, transform PNG image to jpeg/jpg image before use this method!

     */
    func blurredImageAsync(radius: CGFloat, iterations: Int, ratio: CGFloat, blendColor: UIColor? = nil, finish: UIImage! -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            finish(self.blurredImage(radius, iterations: iterations, ratio: ratio, blendColor: blendColor))
        }
    }

    /**
     This method is write by other people...
     ⚠️ PNG Image can not use this method, transform PNG image to jpeg/jpg image before use this method!
     */

    func blurredImage(radius: CGFloat, iterations: Int, ratio: CGFloat, blendColor: UIColor? = nil) -> UIImage! {
        if floorf(Float(size.width)) * floorf(Float(size.height)) <= 0.0 || radius <= 0 {
            return self
        }

        let imageRef = CGImage
        var boxSize = UInt32(radius * scale * ratio)
        if boxSize % 2 == 0 {
            boxSize += 1
        }

        let height = CGImageGetHeight(imageRef)
        let width = CGImageGetWidth(imageRef)
        let rowBytes = CGImageGetBytesPerRow(imageRef)
        let bytes = rowBytes * height

        let inData = malloc(bytes)
        var inBuffer = vImage_Buffer(data: inData, height: UInt(height), width: UInt(width), rowBytes: rowBytes)

        let outData = malloc(bytes)
        var outBuffer = vImage_Buffer(data: outData, height: UInt(height), width: UInt(width), rowBytes: rowBytes)

        let tempFlags = vImage_Flags(kvImageEdgeExtend + kvImageGetTempBufferSize)
        let tempSize = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, boxSize, boxSize, nil, tempFlags)
        let tempBuffer = malloc(tempSize)

        let provider = CGImageGetDataProvider(imageRef)
        let copy = CGDataProviderCopyData(provider)
        let source = CFDataGetBytePtr(copy)
        memcpy(inBuffer.data, source, bytes)

        let flags = vImage_Flags(kvImageEdgeExtend)
        for _ in 0 ..< iterations {
            vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, tempBuffer, 0, 0, boxSize, boxSize, nil, flags)

            let temp = inBuffer.data
            inBuffer.data = outBuffer.data
            outBuffer.data = temp
        }


        let colorSpace = CGImageGetColorSpace(imageRef)
        let bitmapInfo = CGImageGetBitmapInfo(imageRef)
        let bitmapContext = CGBitmapContextCreate(inBuffer.data, width, height, 8, rowBytes, colorSpace, bitmapInfo.rawValue)
        defer {
            free(outBuffer.data)
            free(tempBuffer)
            free(inBuffer.data)
        }

        if let color = blendColor {
            CGContextSetFillColorWithColor(bitmapContext, color.CGColor)
            CGContextSetBlendMode(bitmapContext, CGBlendMode.PlusLighter)
            CGContextFillRect(bitmapContext, CGRect(x: 0, y: 0, width: width, height: height))
        }

        if let bitmap = CGBitmapContextCreateImage(bitmapContext) {
            return UIImage(CGImage: bitmap, scale: scale, orientation: imageOrientation)
        }

        return nil
    }


}
