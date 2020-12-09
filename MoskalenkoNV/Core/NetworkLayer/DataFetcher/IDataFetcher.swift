//
//  IDataFetcher.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/30/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import Foundation

// MARK: - IDataFetcher

protocol IDataFetcher {
    func fetchGeneric<T: Decodable>(_ url: String, _ requestNamager: IRequestManager, _ response: @escaping (T?) -> Void)
}
