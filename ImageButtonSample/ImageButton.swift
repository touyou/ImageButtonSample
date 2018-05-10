//
//  ImageButton.swift
//  ImageButtonSample
//
//  Created by 藤井陽介 on 2018/05/10.
//  Copyright © 2018 touyou. All rights reserved.
//

import UIKit

@IBDesignable
class ImageButton: UIButton {

    @IBInspectable var imageName: String = ""

    override init(frame: CGRect) {

        super.init(frame: frame)
        self.imageView?.contentMode = .scaleAspectFill
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.imageView?.contentMode = .scaleAspectFill
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

        if !self.bounds.contains(point) {

            return nil
        }
        let alphas = self.imageView?.image?.getAlpha()
        let scale: CGFloat = UIScreen.main.scale

        let index = Int(point.x + (point.y * (imageView?.image?.size.width)!) * scale)
        if index < alphas!.count && alphas![index] == 0.0 {
            return nil
        }
        return super.hitTest(point, with: event)
    }
}

extension UIImage {

    func getAlpha() -> [CGFloat] {

        let imageData = self.cgImage?.dataProvider?.data!
        let data: UnsafePointer = CFDataGetBytePtr(imageData)
        let width = self.cgImage!.width
        let height = self.cgImage!.height
        let pixelSize = self.cgImage!.bitsPerPixel / 8

        var alphas = [CGFloat]()
        for i in 0 ..< width * height {
            let alpha = data[i * pixelSize + 3]
            alphas.append(CGFloat(alpha))
        }

        return alphas
    }
}
