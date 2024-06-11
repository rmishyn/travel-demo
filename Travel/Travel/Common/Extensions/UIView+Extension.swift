//
//  UIView+Extension.swift
//  Travel
//
//  Created by Ruslan Mishyn on 10.06.2024.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners:CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
    }
    
    func roundCorners() {
        layer.cornerRadius = frame.size.height * 0.5
    }
}
