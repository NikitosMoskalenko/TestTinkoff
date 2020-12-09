//
//  CompaniesStocksModel.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/29/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import Foundation

// MARK: - CompaniesStocks

struct CompaniesStocksModel: Decodable {
    
    // MARK: Public properties
    
    var symbol: String = ""
    var companyName: String = ""
    var latestPrice: Double = 0.0
    var extendedChange: Double = 0.0

}
