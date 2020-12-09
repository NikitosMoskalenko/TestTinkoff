//
//  ICompaniesStocksMainViewPresenter.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

// MARK: - ICompaniesStocksMainViewPresenter

protocol ICompaniesStocksMainViewPresenter: class {
    
    var data: CompaniesStocksModel? { get set }
    
    func fetchData(_ companySymbol: String, _ completion: @escaping (CompaniesStocksModel?) -> Void)
}
