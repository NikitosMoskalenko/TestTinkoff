//
//  CompaniesStocksMainViewPresenter.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import Foundation

// MARK: - CompaniesStocksMainViewPresenter

final class CompaniesStocksMainViewPresenter: ICompaniesStocksMainViewPresenter {
    
    // MARK: - Constants
    
    struct Constants {
        static let baseURL = "https://cloud.iexapis.com/stable/stock/"
        static let token = "/quote?token=pk_df7b528b028a40fe94134dd90923eb95"

    }
    
    // MARK: Public properties
    
    weak var view: ICompaniesStocksMainView?
    var companyStocksModel: CompaniesStocksModel
    var dataFetcher: IDataFetcher
    var requestManager: IRequestManager
    var data: CompaniesStocksModel?
    
    // MARK: - Lifecycle
    
    init(_ view: ICompaniesStocksMainView?,
         _ companyStocksModel: CompaniesStocksModel,
         _ dataFetcher: IDataFetcher,
         _ requestManager: IRequestManager) {
        self.view = view
        self.companyStocksModel = companyStocksModel
        self.dataFetcher = dataFetcher
        self.requestManager = requestManager
    }
    
    // MARK: - Private methods
    
    private func createURL(_ companySymbol: String) -> String {
        let fullURL = Constants.baseURL + companySymbol + Constants.token
        return fullURL
    }
    
    // MARK: - Public methods
    
    func fetchData(_ companySymbol: String, _ completion: @escaping (CompaniesStocksModel?) -> Void) {
        let fullURL = createURL(companySymbol)
        dataFetcher.fetchGeneric(fullURL, requestManager, completion)
    }
}
