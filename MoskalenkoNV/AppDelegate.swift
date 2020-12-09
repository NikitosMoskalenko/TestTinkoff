//
//  AppDelegate.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit
import CoreData

// MARK: - AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Public properties

    var window: UIWindow?
    var navController: UINavigationController?
    var coordinator: ICoordinator?
    
    // MARK: Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = Coordinator(window, navController: navController)
        coordinator?.start()
        
        return true
    }
    
}

