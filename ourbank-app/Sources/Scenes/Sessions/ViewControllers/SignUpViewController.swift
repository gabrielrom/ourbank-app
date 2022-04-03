import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var inputUserName: InputSharedView!
    @IBOutlet weak var inputEmail: InputSharedView!
    @IBOutlet weak var inputPassword: InputSharedView!
    @IBOutlet weak var createAccountButton: OurbankButtonView!
    
    // Properties
    let viewModel: SessionsCoordinator
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: SessionsCoordinator) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
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
    
    @IBAction func goToSigninScreen(_ sender: Any) {
        print("Indo para a tele de sign in ...")
        viewModel.goToSignin()
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
