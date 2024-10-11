//
//  ViewController.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import UIKit

class PopularMovieListViewController: UIViewController {

    var viewModel: PopularMovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setpViewModel()
    }

    private func setpViewModel() {
        let requestBuilder = SwipFlixRequestBuilder(baseURL: Constants.URLs.baseURL, apiKey: Constants.APIKeys.TMDBKey)
        let networkService = SwipFlixNetworkService(requestBuilder: requestBuilder)
        let apiClient = SwipFlixAPIClient(networkService: networkService)
        
        viewModel = PopularMovieListViewModel(apiClient: apiClient)
    }

}

