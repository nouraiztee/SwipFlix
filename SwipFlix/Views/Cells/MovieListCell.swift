//
//  MovieListCell.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 10/10/2024.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var movieAvatar: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieLanguageView: UIView!
    @IBOutlet weak var movieLanguageLabel: UILabel!
    
    @IBOutlet weak var movieReleaseDateView: UIView!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    
    @IBOutlet weak var movieMaturityRatingView: UIView!
    @IBOutlet weak var movieMaturityRatingLabel: UILabel!
    
    
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        movieLanguageView.isHidden = (movie.originalLanguage?.isEmpty ?? true) ? true : false
        movieReleaseDateView.isHidden = (movie.releaseDate?.isEmpty ?? true) ? true : false
        movieMaturityRatingView.isHidden = (movie.voteAverage == nil ) ? true : false
        
        movieLanguageView.layer.borderWidth = 0.5
        movieLanguageView.layer.borderColor = UIColor.lightGray.cgColor
        
        movieReleaseDateView.layer.borderWidth = 0.5
        movieReleaseDateView.layer.borderColor = UIColor.lightGray.cgColor
        
        movieMaturityRatingView.layer.borderWidth = 0.5
        movieMaturityRatingView.layer.borderColor = UIColor.lightGray.cgColor
        
        if let imagePath = movie.posterPath {
            let imageURL = "\(Constants.URLs.mediaBaseURL)/\(imagePath)"
            loadImage(from: imageURL)
        }
        
        movieTitle.text = movie.title ?? ""
        movieLanguageLabel.text = movie.originalLanguage?.capitalized ?? "N/A"
        movieReleaseDateLabel.text = movie.releaseDate?.components(separatedBy: "-").first ?? "N/A"
        movieMaturityRatingLabel.text = (movie.adult ?? false) ? "18+" : "All"
        movieRatingLabel.text = "\(Int((movie.voteAverage ?? 0) * 10))%"
        
    }
    
    private func loadImage(from url: String) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response , error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.movieAvatar.image = UIImage(data: data)
            }
        }.resume()
    }
    
}
