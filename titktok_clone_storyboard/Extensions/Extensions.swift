//
//  Extensions.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 13/01/2024.
//

import UIKit

extension UILabel {
    func configureWith(_ text: String,
                       color: UIColor,
                       alignment: NSTextAlignment,
                       size: CGFloat,
                       weight: UIFont.Weight = .regular) {
        self.font = .systemFont(ofSize: size, weight: weight)
        
     
        
        
        var title = ""
        if(text == "Kaizen"){
            title = "Kaizen"
        }else if(text == "Worksplace"){
            title = "Seemt"
//        }
//        else if(text == "Message"){
//            title = "Tin nhắn"
        }else if(text == "Notification"){
            title = "Thông báo"
        }else if(text == "Account"){
            title = "Tài khoản"
        }
      
        self.text = text
        self.textColor = color
        self.textAlignment = alignment
    }
}
extension UIView{
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    func animateClick(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.15) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.15) {
                self.transform = CGAffineTransform.identity
            } completion: { _ in completion() }
        }
    }
    
//    func addShadow() {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
//        layer.shadowOpacity = 0.4
//        layer.shadowRadius = 7
//        layer.backgroundColor = ColorUtils.white().cgColor
//    }
}
extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { addArrangedSubview($0) }
    }
}
extension UIColor{
    class func gray_Light_Text () ->UIColor{
        return UIColor(
            red: 153.0 / 255.0,
            green: 153.0 / 255.0,
            blue: 153.0 / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
