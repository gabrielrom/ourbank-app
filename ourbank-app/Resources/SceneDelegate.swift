//
//  SceneDelegate.swift
//  ourbank-app
//
//  Created by GABRIEL MATHEUS RODRIGUES DE SOUZA on 13/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var mainCoordinator: Coordinator?
    let sessionsNavigationController = UINavigationController()
    let appNavigationController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        guard let window = window else { return }
        self.mainCoordinator = MainCoordinator(window: window,
                                               sessionNavigationController: sessionsNavigationController,
                                               appNavigationController: appNavigationController)
        
        _ = self.mainCoordinator?.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

