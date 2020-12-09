//
//  RequestManager.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/30/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import Foundation

// MARK: - RequestManager

final class RequestManager: IRequestManager {
    
    // MARK: - Public methods
    
    func request(_ url: String,_ completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let dataTask = createDataTask(request, completion)
        dataTask.resume()
    }
    
    // MARK: - Private methods
    
    private func createDataTask(_ request: URLRequest,_ completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        return dataTask
    }
}
