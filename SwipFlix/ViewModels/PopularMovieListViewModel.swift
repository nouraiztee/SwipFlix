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
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies() {
        Task {
            do {
                let response = try await apiClient.fetchPopularMovies()
                self.movieList = response ?? []
                reloadData?()
            }catch {
                print(error)
            }
        }
    }
    
    func getMovie(at index: Int) -> Movie {
         movieList[index]
    }
    
    func isListEmpty() -> Bool {
        movieList.isEmpty
    }
    
    var moviesCount: Int {
         movieList.count
    }
}
