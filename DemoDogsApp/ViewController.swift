//
//  ViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchData(URL: "https://dog.ceo/api/breeds/list/all") { result in
            print(result)
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
    
    func fetchData(URL url: String, complition: @escaping ([DogBreeds]) -> Void) {
        
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                
                do {
                let parsingData = try JSONDecoder().decode([DogBreeds].self, from: data!)
                    complition(parsingData)
                } catch {
                    print("Parsing error")
                }
        }
        
        }
        dataTask.resume()


}

}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "hello"
        
        return cell
    }
}


