//
//  PopularMovieListViewModel.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 11/10/2024.
//

import Foundation

class PopularMovieListViewModel {
    private var apiClient: APIClient

    var movieList: [Movie] = []
    var reloadData: (() -> Void)?
    
    init(apiClient: APIClient, movieList: [Movie]) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies() {
        Task {
            do {
                let response = try await apiClient.fetchPopularMovies()
                self.movieList = response ?? []
                reloadData?()
            }
        }
    }
    
    func getMovie(at index: Int) -> Movie {
         movieList[index]
    }
    
    var moviesCount: Int {
         movieList.count
    }
}
