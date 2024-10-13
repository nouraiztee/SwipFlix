//
//  MovieListTableViewHandler.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 11/10/2024.
//

import Foundation
import UIKit

class MovieListTableViewHandler: NSObject, UITableViewDataSource {
    private var viewModel: PopularMovieListViewModel
    var didSelectMovie: ((Movie) -> Void)?
    
    init(viewModel: PopularMovieListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.moviesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellReuseIDs.MovieListCellID, for: indexPath) as! MovieListCell
        let movie = viewModel.getMovie(at: indexPath.row)
        
        cell.configure(with: movie)
        
        return cell
    }
}

extension MovieListTableViewHandler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = viewModel.getMovie(at: indexPath.row)
        didSelectMovie?(selectedMovie)
    }
}
