
import UIKit
import Accelerate

/// 从 bundle 中按照文件名取图片
public func PNGNamed(_ name: String) -> UIImage {

	if let imageResourceString = Bundle.main.path(forResource: name, ofType: "png"), let image = UIImage(contentsOfFile: imageResourceString) {
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
    func scaleToWidth(_ _width: CGFloat) -> UIImage {

        let scaledSize = CGSize(width: _width, height: (height / width) * _width )
        UIGraphicsBeginImageContext(scaledSize)
        draw(in: CGRect(x: 0, y: 0, width: _width, height: scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }

    // TODO: ⚠️ 该方法还未经过测试！
    fileprivate func compressToMaxSize(_ maxSize: Int) -> UIImage {
        var compression = 0.9.f
        let maxCompression = 0.1.f
        var data = UIImageJPEGRepresentation(self, compression)!
        while data.count > maxSize && compression > maxCompression {
            compression -= 0.1.f
            data = UIImageJPEGRepresentation(self, compression)!
        }
        return UIImage(data: data)!
    }
    
    /// 创建一张图片的纯色图片，经典实用场景是不同颜色的气泡
    ///
    /// 来自于: [JSQMessageViewController](https://github.com/jessesquires/JSQMessagesViewController)
    func hl_mask(_ color:UIColor) -> UIImage {
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(imageRect.size, false, scale)
        let context = UIGraphicsGetCurrentContext();
        context?.scaleBy(x: 1.0, y: -1.0);
        context?.translateBy(x: 0.0, y: -imageRect.size.height)
        context?.clip(to: imageRect, mask: cgImage!)
        context?.setFillColor(color.cgColor)
        context?.fill(imageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    /// 获取一张图片的圆角图片
    ///
    /// 来自于: [JSQMessageViewController](https://github.com/jessesquires/JSQMessagesViewController)
    var hl_circularImage : UIImage {
        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        let imgPath = UIBezierPath(ovalIn: frame)
        imgPath.addClip()
        draw(in: frame)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

    var pngData: Data {
		return UIImagePNGRepresentation(self) ?? Data()
	}

    var jpegData: Data {
        return UIImageJPEGRepresentation(self, 1) ?? Data()
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

    class func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let pureColorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return pureColorImage!
    }

    var edgeInsetsToBubble: UIEdgeInsets {
        let center = CGPoint(x: size.width / 2, y: size.height / 2 )
        return UIEdgeInsets(top: center.y, left: center.x, bottom: center.y, right: center.x)
    }

    var resizeableImage: UIImage {
        return resizableImage(withCapInsets: edgeInsetsToBubble, resizingMode: UIImageResizingMode.stretch)
    }

    /**
     ⚠️ PNG Image can not use this method, transform PNG image to jpeg/jpg image before use this method!

     */
    func blurredImageAsync(_ radius: CGFloat, iterations: Int, ratio: CGFloat, blendColor: UIColor? = nil, finish: @escaping (UIImage!) -> Void) {
        DispatchQueue.main.async {
            finish(self.blurredImage(radius, iterations: iterations, ratio: ratio, blendColor: blendColor))
        }
    }

    /**
     This method is write by other people...
     ⚠️ PNG Image can not use this method, transform PNG image to jpeg/jpg image before use this method!
     */

    func blurredImage(_ radius: CGFloat, iterations: Int, ratio: CGFloat, blendColor: UIColor? = nil) -> UIImage! {
        if floorf(Float(size.width)) * floorf(Float(size.height)) <= 0.0 || radius <= 0 {
            return self
        }

        let imageRef = cgImage
        var boxSize = UInt32(radius * scale * ratio)
        if boxSize % 2 == 0 {
            boxSize += 1
        }

        let height = imageRef?.height
        let width = imageRef?.width
        let rowBytes = imageRef?.bytesPerRow
        let bytes = rowBytes! * height!

        let inData = malloc(bytes)
        var inBuffer = vImage_Buffer(data: inData, height: UInt(height!), width: UInt(width!), rowBytes: rowBytes!)

        let outData = malloc(bytes)
        var outBuffer = vImage_Buffer(data: outData, height: UInt(height!), width: UInt(width!), rowBytes: rowBytes!)

        let tempFlags = vImage_Flags(kvImageEdgeExtend + kvImageGetTempBufferSize)
        let tempSize = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, boxSize, boxSize, nil, tempFlags)
        let tempBuffer = malloc(tempSize)

        let provider = imageRef?.dataProvider
        let copy = provider?.data
        let source = CFDataGetBytePtr(copy)
        memcpy(inBuffer.data, source, bytes)

        let flags = vImage_Flags(kvImageEdgeExtend)
        for _ in 0 ..< iterations {
            vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, tempBuffer, 0, 0, boxSize, boxSize, nil, flags)

            let temp = inBuffer.data
            inBuffer.data = outBuffer.data
            outBuffer.data = temp
        }


        let colorSpace = imageRef?.colorSpace
        let bitmapInfo = imageRef?.bitmapInfo
        let bitmapContext = CGContext(data: inBuffer.data, width: width!, height: height!, bitsPerComponent: 8, bytesPerRow: rowBytes!, space: colorSpace!, bitmapInfo: (bitmapInfo?.rawValue)!)
        defer {
            free(outBuffer.data)
            free(tempBuffer)
            free(inBuffer.data)
        }

        if let color = blendColor {
            bitmapContext?.setFillColor(color.cgColor)
            bitmapContext?.setBlendMode(CGBlendMode.plusLighter)
            bitmapContext?.fill(CGRect(x: 0, y: 0, width: width!, height: height!))
        }

        if let bitmap = bitmapContext?.makeImage() {
            return UIImage(cgImage: bitmap, scale: scale, orientation: imageOrientation)
        }

        return nil
    }


}
