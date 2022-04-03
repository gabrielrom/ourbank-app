//
//  ChildCoordinator.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 02/04/22.
//

import Foundation
import UIKit

protocol ChildCoordinator {
    var mainCoordinator: MainCoordinator? { get }
    var rootViewController: UIViewController? { get }
    var navigation: UINavigationController? { get }
    var coordinatorName: String { get }
    
    func start() -> UIViewController
    func stop() -> Void
}

extension ChildCoordinator {
    func next(screen: UIViewController, animated: Bool) {
        self.navigation?.pushViewController(screen, animated: animated)
    }
}
