//
//  ViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var data = [DogsBreed]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        fetchData(URL: "https://dog.ceo/api/breeds/list/all") { result in
            self.data = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
    
    func fetchData(URL url: String, completion: @escaping([DogsBreed]) -> Void) {
        let urlString = "https://dog.ceo/api/breeds/list/all"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let bread = try JSONDecoder().decode([DogsBreed].self, from: data)
                completion(bread)
            } catch {
                print(error)
            }
           

        }.resume()
        


}

}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = UITableViewCell()
        
        cell.textLabel?.text = data[indexPath.row].message
        
        return cell
    }
}


