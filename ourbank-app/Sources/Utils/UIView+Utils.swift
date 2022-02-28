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
    
    func setupInitialView(nibName: String, owner: AnyObject) {
        let nib = UINib(nibName: nibName, bundle: .main)
        let view = nib.instantiate(withOwner: owner, options: nil).first as? UIView ?? UIView()
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
}
