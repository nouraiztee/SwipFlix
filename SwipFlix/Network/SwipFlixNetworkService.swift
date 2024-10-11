//
//  SwipFlixNetworkService.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 11/10/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case decodingError
}

class SwipFlixNetworkService: NetworkService {
    private let urlSession: URLSession
    private let requestBuilder: RequestBuilder
    
    init(urlSession: URLSession, requestBuilder: RequestBuilder) {
        self.urlSession = urlSession
        self.requestBuilder = requestBuilder
    }
    
    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
        let urlRequest = try requestBuilder.buildRequest(for: endpoint)
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        
        return decodedResponse
        
    }
}
