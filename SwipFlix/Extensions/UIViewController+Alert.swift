//
//  UIViewController+Alert.swift
//  SwipFlix
//
//  Created by Nouraiz Taimour on 13/10/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
