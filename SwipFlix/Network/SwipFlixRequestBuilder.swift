//
//  SwipFlixRequestBuilder.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import Foundation

class SwipFlixRequestBuilder: RequestBuilder {
    private let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func buildRequest(for endpoint: Endpoint) throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: true)
        
        guard let url  = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        
        return urlRequest
    }
}
