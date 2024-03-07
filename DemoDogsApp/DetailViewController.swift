//
//  DetailViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

//MARK: - второй экрна

class DetailViewController: UIViewController {
    
    let breedDetailService = BreedDetailService()
    var detailModel: BreedDetails?
    
    
    let nameLabel = UILabel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLabel()
        
        
        let example = "Golden Retriever"
        breedDetailService.fetchBreedDetails(breedName: example) { result in
            switch result {
            case .success(let details):
                print("Breed details for Golden Retriever:")
                print("Life expectancy: \(details.max_life_expectancy) years")
                print("Height (male): \(details.max_height_male) inches")
                // Add more properties as needed
            case .failure(let error):
                print("Error fetching breed details: \(error)")
            }
        }
        
        
      
    }
    
    func setupLabel() {
        
        view.addSubview(nameLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        //nameLabel.text = "cvxcvsdvr"
        
        
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}
