import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var inputUserName: InputSharedView!
    @IBOutlet weak var inputEmail: InputSharedView!
    @IBOutlet weak var inputPassword: InputSharedView!
    @IBOutlet weak var createAccountButton: OurbankButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputUserName.textField.delegate = self
        inputEmail.textField.delegate = self
        inputPassword.textField.delegate = self
        
        createAccountButton.button.addTarget(self,
                                             action: #selector(createAccountButtonAction),
                                             for: .touchUpInside)
    }
    
    @objc func createAccountButtonAction() {
        print(String(repeating: "=", count: 50))
        print("username: \(inputUserName.textField.text ?? "")")
        print("email: \(inputEmail.textField.text ?? "")")
        print("password: \(inputPassword.textField.text ?? "")")
        print(String(repeating: "=", count: 50))
    }
}

extension SignUpViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if inputUserName.textField.isEditing {
            inputUserName.textField.endEditing(true)
        }
        
        else if inputEmail.textField.isEditing {
            inputEmail.textField.endEditing(true)
        }
        
        else if inputPassword.textField.isEditing {
            inputPassword.textField.endEditing(true)
        }
        
        else {
            return
        }
        
        super.touchesBegan(touches, with: event)
    }
    
}
