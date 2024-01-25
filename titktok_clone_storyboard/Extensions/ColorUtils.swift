//
//  ColorUtils.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 21/01/2024.
//

import UIKit

class ColorUtils: NSObject {
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    static func blackTransparent()->UIColor{
        
        let black = hexStringToUIColor(hex: "#000000")
        let blackOpacity = black.withAlphaComponent(0.7)
        return blackOpacity;
    }
}
