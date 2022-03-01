//
//  InputSharedView.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 24/02/22.
//

import UIKit

@IBDesignable
class InputSharedView: UIView, BaseXibViewProtocol {
    private(set) var nibName: String = "InputSharedView"
    
    @IBOutlet weak var textField: UITextField!
   
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

extension InputSharedView {
    @IBInspectable var paddingLeft: CGFloat {
        get { return self.paddingLeft }
        set { setPaddingLeft(newValue) }
    }
    
    @IBInspectable var paddingRight: CGFloat {
        get { return self.paddingRight }
        set { setPaddingRight(newValue) }
    }
    
    @IBInspectable var placeHolder: String {
        get { return self.placeHolder }
        set { setPlaceholderValue(newValue) }
    }
    
    @IBInspectable var placeHolderFont: String {
        get { return self.placeHolderFont }
        set { setPlaceholderFont(newValue) }
    }
    
    @IBInspectable var placeHolderColor: UIColor {
        get { return self.placeHolderColor }
        set { setPlaceholderColor(newValue) }
    }
    
    @IBInspectable var inputType: String {
        get { return self.inputType }
        set { setTypeOfInput(newValue) }
    }
}

extension InputSharedView {
    private func setPaddingLeft(_ paddingLeft: CGFloat) {
        self.textField.leftViewMode = .always
        self.textField.leftView = UIView(frame: CGRect(
            x: 0, y: 0,
            width: paddingLeft,
            height: self.textField.frame.height))
    }
    
    private func setPaddingRight(_ paddingRight: CGFloat) {
        self.textField.rightViewMode = .always
        self.textField.rightView = UIView(frame: CGRect(
            x: 0, y: 0,
            width: paddingRight,
            height: self.textField.frame.height))
    }
    
    private func setPlaceholderValue(_ placeHolder: String) {
        self.textField.placeholder = placeHolder
    }
    
    private func setPlaceholderFont(_ placeHolderFont: String) {
        if !placeHolderFont.contains("|") { return }
        
        let values = placeHolderFont.components(separatedBy: "|")
        let fontName = values[0].trimmingCharacters(in: .whitespacesAndNewlines)
        var fontSize: CGFloat = 5
        
        if let number = NumberFormatter().number(from: values[1].trimmingCharacters(in: .whitespacesAndNewlines)) {
            fontSize = CGFloat(truncating: number)
        }
        
        self.textField.attributedPlaceholder = NSAttributedString(
            string: textField.placeholder!,
            attributes: [
                .font: UIFont(name: fontName,
                              size: fontSize)!])
    }
    
    private func setPlaceholderColor(_ placeHolderColor: UIColor) {
        self.textField.attributedPlaceholder = NSAttributedString(
            string: textField.placeholder!,
            attributes: [.foregroundColor: placeHolderColor]
        )
    }
    
    private func setTypeOfInput(_ inputType: String) {
        switch inputType {
        case "username":
            self.textField.textContentType = .name
            self.textField.autocapitalizationType = .words
            break
        case "email":
            self.textField.textContentType = .emailAddress
            self.textField.autocapitalizationType = .none
            self.textField.keyboardType = .emailAddress
            break
        case "password":
            self.textField.textContentType = .password
            self.textField.isSecureTextEntry = true
            self.textField.autocapitalizationType = .none
            break
        default:
            self.textField.textContentType = .name
            break
        }
    }
}
