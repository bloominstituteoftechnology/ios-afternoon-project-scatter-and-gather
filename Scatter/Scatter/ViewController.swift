//
//  ViewController.swift
//  Scatter
//
//  Created by John Kouris on 9/20/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabelsAndImage()
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    private func createLabelsAndImage() {
        
        let letter1 = UILabel()
        letter1.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter1)
        letter1.text = "L"
        
        let letter2 = UILabel()
        letter2.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter2)
        letter2.text = "a"
        
        let letter3 = UILabel()
        letter3.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter3)
        letter3.text = "m"
        
        let letter4 = UILabel()
        letter4.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter4)
        letter4.text = "b"
        
        let letter5 = UILabel()
        letter5.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter5)
        letter5.text = "d"
        
        let letter6 = UILabel()
        letter6.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter6)
        letter6.text = "a"
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        image.image = UIImage(named: "lambda_logo")
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(letter1)
        stackView.addArrangedSubview(letter2)
        stackView.addArrangedSubview(letter3)
        stackView.addArrangedSubview(letter4)
        stackView.addArrangedSubview(letter5)
        stackView.addArrangedSubview(letter6)
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        image.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    


}

