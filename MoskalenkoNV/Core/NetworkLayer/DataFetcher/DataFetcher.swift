//
//  DataFetcher.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/30/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import Foundation

// MARK: - DataFetcher

final class DataFetcher: IDataFetcher {
    
    // MARK: - Private properties
    
    var networkRequest: IRequestManager?
    
    // MARK: Public methods
    
    private func parseJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch let error {
            print("Failed to decode JSON: \(error)")
            return nil
        }
    }
    
    func fetchGeneric<T: Decodable>(_ url: String, _ requestNamager: IRequestManager, _ response: @escaping (T?) -> Void) {
        requestNamager.request(url) { (data, error) in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    let decode = self.parseJSON(type: T.self, from: data)
                    response(decode)
                } else {
                    response(nil)
                }
            }
        }
    }
    
}
