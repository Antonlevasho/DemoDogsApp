//
//  DetailViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 06.03.2024.
//

import UIKit

//MARK: - второй экрна

class DetailViewController: UIViewController {
    
    //MARK: -
    let breedDetailService = BreedDetailService()
    var detailModel: BreedDetails?
    var breed: String?
    var imageModel: ImageDogs?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupTableView()
        title = breed
        
        guard let breed = breed else {
            return
        }
        breedDetailService.fetchBreedDetails(breedName: breed) { result in
            switch result {
            case .success(let details):
                self.detailModel = details
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("Breed details for Golden Retriever:", details)
            case .failure(let error):
                print("Error fetching breed details: \(error)")
            }
        }
            }
    
    //MARK: - setup Table View
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
//MARK: -open Image VC
    
    func openImageVC(for imageBreed: String) {
        
        let imageVC = ImageViewController()
        imageVC.imageBreed = imageBreed
        navigationController?.pushViewController(imageVC, animated: true)
        
    }
}

//MARK: - extension
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        let imageBreed = cell?.textLabel?.text
        
        guard let imageBreed = imageBreed else {
            return
        }
        openImageVC(for: imageBreed)
    }
}


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

