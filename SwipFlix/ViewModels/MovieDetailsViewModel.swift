//
//  MovieDetailsViewModel.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 13/10/2024.
//

import Foundation

class MovieDetailsViewModel {
    private var apiClient: APIClient
    private let movieId: Int
    
    var movieDetails: MovieDetailsModel?
    
    var updateUI: (() -> Void)?
    var showError: ((String) -> Void)?
    
    init(apiClient: APIClient, movieId: Int) {
        self.apiClient = apiClient
        self.movieId = movieId
    }
    
    func fetchMovieDetails(movieId: Int) {
          Task {
              do {
                  let movieDetail: MovieDetailsModel? = try await apiClient.fetchMovieDetails(movieId: movieId)
                  self.movieDetails = movieDetail ?? nil
                  updateUI?()
              } catch {
                  print(error)
                  showError?("Failed to fetch movie details: \(error.localizedDescription)")
              }
          }
      }
    
    func movieTitle() -> String {
        return movieDetails?.title ?? "Unknown Title"
    }
    
    func movieOverview() -> String {
        return movieDetails?.overview ?? "No description available."
    }
    
    func moviePosterPath() -> String? {
        if let imagePath = movieDetails?.posterPath {
            let imageURL = "\(Constants.URLs.mediaBaseURL)/\(imagePath)"
            return imageURL
        }
        return nil
    }
}
