//
//  IRequestManager.swift
//  MoskalenkoNV
//
//  Created by Nikita Moskalenko on 8/30/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import Foundation

// MARK: - IRequestManager

protocol IRequestManager {
     func request(_ url: String,_ completion: @escaping (Data?, Error?) -> Void)
}
