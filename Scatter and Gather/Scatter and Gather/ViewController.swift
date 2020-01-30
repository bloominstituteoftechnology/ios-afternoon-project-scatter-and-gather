//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by David Wright on 1/30/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    let word: String = "Lambda"
    var isScattered: Bool = false
    
    var lambdaLetterLabels: [UILabel]! = []
    var lambdaLogoImageView: UIImageView!
    
    // MARK: - Actions

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLetterLabels()
        configureImageView()
    }

    // MARK: - Private Methods

    private func configureLetterLabels() {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
        
        var letterLabels: [UILabel] = []
        
        for letter in word {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = String(letter)
            label.textAlignment = .center
            label.font = UIFont.monospacedSystemFont(ofSize: 52, weight: .regular)
            
            view.addSubview(label)
            stackView.addArrangedSubview(label)
            letterLabels.append(label)
        }
        
        lambdaLetterLabels = letterLabels
    }
    
    private func configureImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5)
        ])
        
        lambdaLogoImageView = imageView
    }

}
