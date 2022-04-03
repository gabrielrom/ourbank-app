//
//  SessionsCoordinator.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 02/04/22.
//

import Foundation
import UIKit

class SessionsCoordinator: ChildCoordinator {
    var coordinatorName: String = "SessionsCoordinator"
    weak var mainCoordinator: MainCoordinator?
    
    var rootViewController: UIViewController?
    var navigation: UINavigationController?
    
    init(navigation: UINavigationController,
         mainCoordinator: MainCoordinator) {
        self.navigation = navigation
        self.navigation?.isNavigationBarHidden = true
        self.mainCoordinator = mainCoordinator
    }
    
    deinit {
        print("Killing: \(self)")
    }
    
    @discardableResult
    func start() -> UIViewController {
        let signupViewController = SignUpViewController(viewModel: self)
        self.rootViewController = signupViewController
        next(screen: signupViewController, animated: false)
        return signupViewController
    }
    
    func goToSignin() {
        let signinViewController = SignInViewController()
        next(screen: signinViewController, animated: true)
    }
    
    func stop() { }

}
