//
//  Constant.swift
//  Graduation
//
//  Created by Flint Pham on 1/31/19.
//  Copyright © 2019 Flint Pham. All rights reserved.
//

import Foundation
import UIKit

let WINDOW = UIApplication.shared.windows[0]
let SAFE_AREA = WINDOW.safeAreaLayoutGuide.layoutFrame

let TOP_STATUS_HEIGHT:CGFloat       =   UIApplication.shared.statusBarFrame.height // == SAFE_AREA.minY
let BOTTOM_STATUS_HEIGHT:CGFloat    =   WINDOW.frame.maxY - SAFE_AREA.maxY
let SCREEN_WIDTH:CGFloat            =   UIScreen.main.bounds.size.width
let SCREEN_HEIGHT:CGFloat           =   UIScreen.main.bounds.size.height

extension UIImage {
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 5, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
