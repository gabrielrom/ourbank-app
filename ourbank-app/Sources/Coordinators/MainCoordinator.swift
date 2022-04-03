//
//  MainCoordinator.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 02/04/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    private(set) var rootViewController: UIViewController?
    private(set) var window: UIWindow
    
    var childCoordinators: [String: ChildCoordinator] = [String: ChildCoordinator]()
    
    public var sessionNavigationController: UINavigationController
    public var appNavigationController: UINavigationController
    
    init(window: UIWindow,
         sessionNavigationController: UINavigationController,
         appNavigationController: UINavigationController) {
        self.window = window
        self.sessionNavigationController = sessionNavigationController
        self.appNavigationController = appNavigationController
        self.window.rootViewController = self.sessionNavigationController
        self.window.makeKeyAndVisible()
    }
    
    deinit {
        print("Killing: \(self)")
    }
    
    @discardableResult
    func start() -> UIViewController {
        let sessionsCoordinator = SessionsCoordinator(navigation: sessionNavigationController,
                                                      mainCoordinator: self)
        
        addCoordinator(sessionsCoordinator)
        return sessionsCoordinator.start()
    }
    
    func addCoordinator(_ childCoordinator: ChildCoordinator) {
        childCoordinators[childCoordinator.coordinatorName] = childCoordinator
    }
    
    func removeCoordinator(_ childCoordinator: ChildCoordinator) {
        childCoordinators.removeValue(forKey: childCoordinator.coordinatorName)
    }
    
    func stop() { }
}
