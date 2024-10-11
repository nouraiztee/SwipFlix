//
//  MovieListTableViewHandler.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 11/10/2024.
//

import Foundation
import UIKit

class MovieListTableViewHandler: NSObject, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
        
        return cell
    }
}
