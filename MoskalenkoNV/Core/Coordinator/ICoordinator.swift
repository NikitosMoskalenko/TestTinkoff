//
//  ICoordinator.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

// MARK: - ICoordinator

protocol ICoordinator: class {
    
    // MARK: Public properties
    
    var window: UIWindow? { get }
    
    // MARK: Public methods
    
    func start() 
}
