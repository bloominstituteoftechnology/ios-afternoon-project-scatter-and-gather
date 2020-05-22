//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Clayton Watkins on 5/22/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    var lLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var a2Label = UILabel()
    var logoImageView = UIImageView()
    var stackView = UIStackView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLabels()
        configureImageView()
        configureNavandButton()
    }
    
    //MARK: - Private Functions
    private func configureLabels(){
        // Creating stack view for labels
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        // Stack View Constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        // Adding labels to stack view
        // L
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.font = UIFont.boldSystemFont(ofSize: 75)
        lLabel.textColor = .red
        stackView.addArrangedSubview(lLabel)
        
        // A
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "A"
        aLabel.font = UIFont.boldSystemFont(ofSize: 75)
        aLabel.textColor = .blue
        stackView.addArrangedSubview(aLabel)
        
        // M
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "M"
        mLabel.font = UIFont.boldSystemFont(ofSize: 75)
        mLabel.textColor = .yellow
        stackView.addArrangedSubview(mLabel)
        
        // B
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "B"
        bLabel.font = UIFont.boldSystemFont(ofSize: 75)
        bLabel.textColor = .green
        stackView.addArrangedSubview(bLabel)
        
        // D
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "D"
        dLabel.font = UIFont.boldSystemFont(ofSize: 75)
        dLabel.textColor = .brown
        stackView.addArrangedSubview(dLabel)
        
        // A
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        a2Label.text = "A"
        a2Label.font = UIFont.boldSystemFont(ofSize: 75)
        a2Label.textColor = .purple
        stackView.addArrangedSubview(a2Label)
    }

    private func configureImageView(){
        
        // Setting up Image View
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "lambda_logo")
        view.addSubview(logoImageView)
        
        // Constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1)
        ])
    }
    
    private func configureNavandButton(){
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: 44))
        navigationBar.backgroundColor = .systemBackground
        
        let navigationItem = UINavigationItem()
        navigationItem.title = "Animations"
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonTapped))
        
        navigationItem.rightBarButtonItem = toggleButton
        navigationBar.items = [navigationItem]
        
        view.addSubview(navigationBar)
    }
    
    @objc func toggleButtonTapped(){
        
    }
}

