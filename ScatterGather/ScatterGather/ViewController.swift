//
//  ViewController.swift
//  ScatterGather
//
//  Created by Jorge Alvarez on 1/21/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var lLabel: UILabel!
    var aLabel: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!
    var stackView: UIStackView!
    
    var labelArray: [UILabel] = []
    
    var logoImageView: UIImageView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        configureLabels()
    }

    // MARK: - Views
    
    func configureImage() {
        // ImageView
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "lambda_logo")
        //logoImageView.backgroundColor = .blue
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // Constraints
        logoImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func configureLabels() {
        
        // Labels
        lLabel = UILabel(); lLabel.text = "L"
        aLabel = UILabel(); aLabel.text = "A"
        mLabel = UILabel(); mLabel.text = "M"
        bLabel = UILabel(); bLabel.text = "B"
        dLabel = UILabel(); dLabel.text = "D"
        a2Label = UILabel(); a2Label.text = "A"
        
        labelArray = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        // StackView
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -20).isActive = true
        
        for label in labelArray {
            label.translatesAutoresizingMaskIntoConstraints = false
            //label.textColor = .red
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 60)
            view.addSubview(label)
            stackView.addArrangedSubview(label)
        }
    }
    
    // MARK: - Actions

}

