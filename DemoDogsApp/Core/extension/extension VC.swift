//
//  extension VC.swift
//  DemoDogsApp
//
//  Created by Анастасия on 20.03.2024.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //MARK: -
        let cell = tableView.cellForRow(at: indexPath)
        let breed = cell?.textLabel?.text
        
        guard let breed = breed else {
            return
        }
        openDetails(for: breed)
        
        //MARK: -
        
        let cell2 = tableView.cellForRow(at: indexPath)
        let imageBreed = cell2?.textLabel?.text
        
        guard let imageBreed = imageBreed else {
            return
        }
        openImageVC(for: imageBreed)
    }

}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.message.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // Configure the cell with data from breeds.message
        if let breedName = data?.message.keys.sorted()[indexPath.row] {
            cell.textLabel?.text = breedName
        }
        return cell
    }
}
