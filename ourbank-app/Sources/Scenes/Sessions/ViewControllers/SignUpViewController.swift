import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var inputUserName: InputSharedView!
    @IBOutlet weak var inputEmail: InputSharedView!
    @IBOutlet weak var inputPassword: InputSharedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputUserName.textField.delegate = self
        inputEmail.textField.delegate = self
        inputPassword.textField.delegate = self
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
