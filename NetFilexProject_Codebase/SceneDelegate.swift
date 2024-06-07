//
//  SceneDelegate.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let firstViewController = UINavigationController(rootViewController: NetfliexMainViewController())
        let secondViewController = UINavigationController(rootViewController: NewAndHotViewController())
        let thirdViewController = UINavigationController(rootViewController: SavedContentsViewController())
        let tabarController = UITabBarController()
        tabarController.setViewControllers([firstViewController, secondViewController,thirdViewController], animated: true)
        
        tabarController.tabBar.tintColor = .white
        tabarController.tabBar.barTintColor = .systemGray5
        
        if let items = tabarController.tabBar.items {
            
            items[0].selectedImage = UIImage(systemName: "house.fill")
            items[0].image = UIImage(systemName: "house")
            items[0].title = "홈"
            
            items[1].selectedImage = UIImage(systemName: "play.rectangle.on.rectangle.fill")
            items[1].image = UIImage(systemName: "play.rectangle.on.rectangle")
            items[1].title = "New & Hot"
            
            items[2].selectedImage = UIImage(systemName: "arrow.down.circle.fill")
            items[2].image = UIImage(systemName: "arrow.down.circle")
            items[2].title = "저장된 콘텐츠 목록"
            
        }
        
        let mainvc = DailyBoxOfficeViewController()
        let navigationController = UINavigationController(rootViewController: mainvc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

