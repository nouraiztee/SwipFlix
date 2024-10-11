//
//  SwipFlixRequestBuilder.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import Foundation

class SwipFlixRequestBuilder: RequestBuilder {
    private let baseURL: String
    private let apiKey: String
    
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func buildRequest(for endpoint: Endpoint) throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        var urlComponents = URLComponents(url: url.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
        guard let url  = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        
        return urlRequest
    }
}
