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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        fetchDogBreeds { result in
            switch result {
            case .success(let breeds):
                self.data = breeds
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("Dog breeds: \(breeds.message.keys)")
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

    func fetchDogBreeds(completion: @escaping (Result<DogBreeds, Error>) -> Void) {
        let urlString = "https://dog.ceo/api/breeds/list/all"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let breeds = try decoder.decode(DogBreeds.self, from: data)
                completion(.success(breeds))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
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


//class ViewController: UIViewController {
//
//    let tableView = UITableView()
//    var data: DogBreeds?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//  setupTableView()
//
//        fetchDogBreeds { result in
//            switch result {
//            case .success(let breeds):
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                                   }
//                print("Dog breeds: \(breeds.message.keys)")
//            case .failure(let error):
//                print("Error fetching dog breeds: \(error)")
//            }
//        }
//    }
//
//    func setupTableView() {
//        view.addSubview(tableView)
//
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//
//    }
//
//    func fetchDogBreeds(completion: @escaping (Result<DogBreeds, Error>) -> Void) {
//        let urlString = "https://dog.ceo/api/breeds/list/all"
//
//        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let breeds = try decoder.decode(DogBreeds.self, from: data)
//                completion(.success(breeds))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//
//
//}
//
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//}
//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data?.message.keys.count ?? 0
////        return 10
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let breedName = data?.message.keys.sorted()[indexPath.row]
//        let cell = UITableViewCell()
//        cell.textLabel?.text = breedName
//
//        return cell
//    }
//}
//
//
