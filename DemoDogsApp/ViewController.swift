//
//  ViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//


import UIKit

class ViewController: UIViewController {
    
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

    func openDetails(for breed: String) {

        let detailVC = DetailViewController()
        detailVC.breed = breed

        navigationController?.pushViewController(detailVC, animated: true)

    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       let cell = tableView.cellForRow(at: indexPath)
        let breed = cell?.textLabel?.text
        guard let breed = breed else {
            return
        }
        openDetails(for: breed)
        
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

