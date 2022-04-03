//
//  Flow.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 02/04/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [String: ChildCoordinator] { get set }
    var rootViewController: UIViewController? { get }
    
    func start() -> UIViewController
    func stop() -> Void
    func addCoordinator(_ childCoordinator: ChildCoordinator) -> Void
    func removeCoordinator(_ childCoordinator: ChildCoordinator) -> Void
}
