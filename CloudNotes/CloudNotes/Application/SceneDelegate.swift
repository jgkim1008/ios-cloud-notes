//
//  CloudNotes - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import OSLog

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            os_log(.fault, log: .ui, OSLog.objectCFormatSpecifier, UIError.downcastingFailed(subject: "scene", location: #function).localizedDescription)
            return
        }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let splitViewController = NoteSplitViewController(style: .doubleColumn)
        let sideBarViewController = NoteListViewController(noteSplitViewDelegate: splitViewController)
        let secondaryViewController = NoteDetailViewController()
        
        splitViewController.setViewController(sideBarViewController, for: .primary)
        splitViewController.setViewController(secondaryViewController, for: .secondary)
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
