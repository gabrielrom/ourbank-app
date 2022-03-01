//
//  OurbankButtonView.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 28/02/22.
//

import UIKit

@IBDesignable
class OurbankButtonView: UIView, BaseXibViewProtocol {
    private(set) var nibName: String = "OurbankButtonView"
    
    @IBOutlet weak var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialView(nibName: nibName,
                         owner: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialView(nibName: nibName,
                         owner: self)
    }
}

extension OurbankButtonView {
    @IBInspectable var buttonBackgroundColor: UIColor? {
        get { self.buttonBackgroundColor }
        set { setBackgroundColor(newValue ?? UIColor(named: "ButtonPrimary")!) }
    }
    
    @IBInspectable var buttonTitle: String? {
        get { self.buttonTitle }
        set { setButtonTitle(newValue ?? "") }
    }
    
}

extension OurbankButtonView {
    private func setBackgroundColor(_ color: UIColor) {
        button.layer.backgroundColor = color.cgColor
    }
    
    private func setButtonTitle(_ title: String) {
        button.titleLabel?.text = title
    }
}
