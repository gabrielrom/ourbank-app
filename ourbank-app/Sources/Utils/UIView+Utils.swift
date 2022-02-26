//
//  UIView+Utils.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 25/02/22.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
