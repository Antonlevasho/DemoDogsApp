//
//  extension DVC.swift
//  DemoDogsApp
//
//  Created by Анастасия on 20.03.2024.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let detailModel = detailModel {
            if detailModel.message.count > 0 {
                return detailModel.message.count
            } else {
                return 1           }
        } else  {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        guard let detailModel = detailModel else {
            cell.textLabel?.text = "error"
            return cell
        }
        if detailModel.message.count > indexPath.row
        {
            let name = detailModel.message[indexPath.row]
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No breed"
        }
        return cell
    }
}
