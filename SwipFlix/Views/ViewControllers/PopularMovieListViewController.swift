//
//  ViewController.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import UIKit

class PopularMovieListViewController: UIViewController {
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    var viewModel: PopularMovieListViewModel!
    var tableDataAndEventsHandler: MovieListTableViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let textAttributes = [NSAttributedString.Key.foregroundColor :UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
        setpViewModel()
        setupTableView()
        bindViewModel()
        
        viewModel.fetchPopularMovies()
    }

    private func setpViewModel() {
        let requestBuilder = SwipFlixRequestBuilder(baseURL: Constants.URLs.baseURL, apiKey: Constants.APIKeys.TMDBKey)
        let networkService = SwipFlixNetworkService(requestBuilder: requestBuilder)
        let apiClient = SwipFlixAPIClient(networkService: networkService)
        
        viewModel = PopularMovieListViewModel(apiClient: apiClient)
        
        tableDataAndEventsHandler = MovieListTableViewHandler(viewModel: viewModel)
    }
    
    private func setupTableView() {
        movieListTableView.register(UINib(nibName: "MovieListCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
        
        tableDataAndEventsHandler.didSelectMovie = { [weak self] movie in
            self?.showMovieDetailView(movie)
        }
        movieListTableView.dataSource = tableDataAndEventsHandler
        movieListTableView.delegate = tableDataAndEventsHandler
        
        
        movieListTableView.clipsToBounds = true
        movieListTableView.layer.cornerRadius = 12
        movieListTableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func bindViewModel() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.movieListTableView.reloadData()
            }
        }
    }
    
    private func showMovieDetailView(_ movie: Movie) {
        guard let movieId = movie.id else {
            
            return
        }
        
        let movieDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        movieDetailVC.movieId = movieId
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }

}

