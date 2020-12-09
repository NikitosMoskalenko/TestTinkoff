//
//  Coordinator.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

// MARK: - Coordinator

final class Coordinator: ICoordinator {
    
    // MARK: Public properties
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    // MARK: - Lifecycle
    
    init(_ window: UIWindow?, navController: UINavigationController?) {
        self.window = window
        self.navigationController = navController
    }
    
    // MARK: Public methods
    
    func start() {
        setWindow()
    }
    
}

// MARK: - Extensions

private extension Coordinator {
    
    func setWindow() {
        let mainViewController = Builder.createCompaniesStocksView(self)
        navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        window?.backgroundColor = .white
    }
    
}
