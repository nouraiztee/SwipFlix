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
    
}
