//
//  ImgeViewController.swift
//  DemoDogsApp
//
//  Created by Анастасия on 13.03.2024.
//

import UIKit

class ImageViewController: UIViewController {
    
    //MARK: -
    let imageService = ImageService()
    let imageView = UIImageView()
    let firstImageView = UIImageView()

    var imageBreed: String?
    var imageModel: ImageDogs?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Images"
        guard let imageBreed = imageBreed else { return }
        
        
        imageService.fetchDogImage(name: imageBreed) { image in
            DispatchQueue.main.async {
                self.firstImageView.image = image
            }
        }
        setupImageView()
        setupFirstIV()

}
    
    //MARK: - setup First IV
    func setupFirstIV() {
        
        view.addSubview(firstImageView)
        firstImageView.backgroundColor = .white
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        
        firstImageView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        firstImageView.center = self.view.center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        firstImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        firstImageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        firstImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        firstImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    //MARK: -setup Background ImageView
    func setupImageView() {
        
        if let image = UIImage(named: "1") {
            imageView.image = image
        }
        imageView.alpha = 0.5
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }

}
