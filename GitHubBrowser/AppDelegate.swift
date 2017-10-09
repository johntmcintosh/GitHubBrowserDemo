//
//  AppDelegate.swift
//  GitHubBrowser
//
//  Created by John McIntosh on 10/5/17.
//  Copyright © 2017 John T McIntosh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var repoListCoordinator: RepoListCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let navController = UINavigationController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
        
        // NOTE: For a production app, I would typically create a root object as an
        // Application Coordinator which would manage things like authentication state.
        // However since we don't have any logic needed at an application level for
        // this small app, I'm just presenting the list coordintor directly.
        let coordinator = RepoListCoordinator(navigationController: navController)
        coordinator.start()
        self.repoListCoordinator = coordinator
        
        return true
    }
}
