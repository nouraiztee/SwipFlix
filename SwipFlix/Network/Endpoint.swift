//
//  Endpoint.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import Foundation

enum Endpoint {
    case popularMovies
    case movieDetails(movieId: Int)

    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        case .movieDetails(let movieId):
            return "/3/movie/\(movieId)"
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
}

enum HTTPMethod: String {
    case GET
}

