//
//  MovieDetailsViewController.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 13/10/2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieAvatar: UIImageView!
    
    @IBOutlet weak var movieDetailsView: UIView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    var movieId: Int!
    var viewModel: MovieDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        setpViewModel()
        bindViewModel()
        viewModel.fetchMovieDetails(movieId: movieId)
    }
    
    private func setupUI() {
        let textAttributes = [NSAttributedString.Key.foregroundColor :UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        movieDetailsView.clipsToBounds = true
        movieDetailsView.layer.cornerRadius = 12
        movieDetailsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func setpViewModel() {
        let requestBuilder = SwipFlixRequestBuilder(baseURL: Constants.URLs.baseURL, apiKey: Constants.APIKeys.TMDBKey)
        let networkService = SwipFlixNetworkService(requestBuilder: requestBuilder)
        let apiClient = SwipFlixAPIClient(networkService: networkService)
        
        viewModel = MovieDetailsViewModel(apiClient: apiClient, movieId: movieId)
    }
    
    private func bindViewModel() {
        viewModel.updateUI = { [weak self] in
            if let posterURL = self?.viewModel.moviePosterPath() {
                self?.loadImage(from: posterURL)
            }else {
                self?.movieAvatar.image = UIImage(named: "ic_pic_unavailable")
            }
           
            DispatchQueue.main.async {
                self?.movieTitle.text = self?.viewModel.movieTitle()
                self?.movieDescription.text = self?.viewModel.movieOverview()
            }
        }
        
        viewModel.showError = { [weak self] errorMsg in
            DispatchQueue.main.async {
                self?.showErrorAlert(message: errorMsg)
            }
            
        }
    }
    
    private func loadImage(from url: String) {
        guard let url = URL(string: url) else {
            self.movieAvatar.image = UIImage(named: "ic_pic_unavailable")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response , error in
            guard let data = data, error == nil else {
                self?.movieAvatar.image = UIImage(named: "ic_pic_unavailable")
                return
            }
            
            DispatchQueue.main.async {
                self?.movieAvatar.image = UIImage(data: data)
            }
        }.resume()
    }

}
