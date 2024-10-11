//
//  SwipFlixAPIClient.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 11/10/2024.
//

import Foundation

protocol APIClient {
    func fetchPopularMovies() async throws -> [Movie]?
}

class SwipFlixAPIClient: APIClient {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchPopularMovies() async throws -> [Movie]? {
        let enpoint = Endpoint.popularMovies
        let response: MovieDataModel = try await networkService.request(enpoint)
        return response.results
    }
}
