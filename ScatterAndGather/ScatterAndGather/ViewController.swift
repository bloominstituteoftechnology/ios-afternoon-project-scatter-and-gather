//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Kat Milton on 7/17/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        configureImage()
        
        // Do any additional setup after loading the view.
    }
    
    func configureLabels() {
        // Create labels
        let lLabel = UILabel()
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 56)
        
        let a1Label = UILabel()
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        a1Label.text = "a"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 56)
        
        let mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "m"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 56)
        
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "b"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 56)
        
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "d"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 56)
        
        let a2Label = UILabel()
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        a2Label.text = "a"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 56)
        
        // Stack view Setup
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add labels to stack view
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(a1Label)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(a2Label)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }

    func configureImage() {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.image = UIImage(named: "lambda_logo")
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        

    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
    }

}

