//
//  NetworkService.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 11/10/2024.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
