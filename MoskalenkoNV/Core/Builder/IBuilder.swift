//
//  IBuilder.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

// MARK: IBuilder

protocol IBuilder {
    
    static func createCompaniesStocksView(_ coordinator: ICoordinator) -> CompaniesStocksMainView
}
