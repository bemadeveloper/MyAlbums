//
//  SceneDelegate.swift
//  MyAlbums
//
//  Created by Bema on 1/4/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = TabBarController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

//        let viewController = ViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
