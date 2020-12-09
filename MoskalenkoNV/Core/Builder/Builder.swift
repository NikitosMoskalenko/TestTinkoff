//
//  Builder.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

// MARK: - Builder

final class Builder: IBuilder {
    
    // MARK: - Public methods
    
    static func createCompaniesStocksView(_ coordinator: ICoordinator) -> CompaniesStocksMainView {
        let mainViewController = CompaniesStocksMainView()
        let companyStocksModel = CompaniesStocksModel()
        let dataFetcher = DataFetcher()
        let requestManager = RequestManager()
        let presenter = CompaniesStocksMainViewPresenter(mainViewController,
                                                         companyStocksModel,
                                                         dataFetcher,
                                                         requestManager)
        mainViewController.presenter = presenter
        
        return mainViewController
    }
}
