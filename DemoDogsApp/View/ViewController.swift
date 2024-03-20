//
//  ViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//


import UIKit

class ViewController: UIViewController {
    
    //MARK: -
    
    let tableView = UITableView()
    
    var data: DogBreeds?
    var detailData: BreedDetails?
    var reportService = ReportService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        title = "All dog breeds"
        
        
        reportService.fetchDogBreeds { result in
            switch result {
            case .success(let breeds):
                self.data = breeds
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("Dog breeds: \(breeds.message.count)")
            case .failure(let error):
                print("Error fetching dog breeds: \(error)")
            }
        }
        
        
        
    }
    
    //MARK: - setup Table View
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    //MARK: - open Details
    
    func openDetails(for breed: String) {
        
        let detailVC = DetailViewController()
        detailVC.breed = breed
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    //MARK: - open Image VC
    
    func openImageVC(for imageBreed: String) {
        
        let imageVC = ImageViewController()
        imageVC.imageBreed = imageBreed
        
        navigationController?.pushViewController(imageVC, animated: true)
        
    }
    
}
