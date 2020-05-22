//
//  ViewController.swift
//  ScatterGather
//
//  Created by Kenneth Jones on 5/22/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
    }
    
    private func configureSubviews() {
        let capLLabel = UILabel()
        capLLabel.translatesAutoresizingMaskIntoConstraints = false
        capLLabel.text = "L"
        capLLabel.textAlignment = .center
        capLLabel.font = UIFont.systemFont(ofSize: 33)
        
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "a"
        aLabel.textAlignment = .center
        aLabel.font = UIFont.systemFont(ofSize: 33)
        
        let mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "m"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 33)
        
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "b"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 33)
        
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "d"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 33)
        
        let endALabel = UILabel()
        endALabel.translatesAutoresizingMaskIntoConstraints = false
        endALabel.text = "a"
        endALabel.textAlignment = .center
        endALabel.font = UIFont.systemFont(ofSize: 33)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(capLLabel)
        stackView.addArrangedSubview(aLabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(endALabel)
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "lambda_logo")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            imageView.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}

