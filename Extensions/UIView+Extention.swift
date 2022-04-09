//
//  UIView+Extention.swift
//  AppRaoVat
//
//  Created by Lê Công Minh on 08/04/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
