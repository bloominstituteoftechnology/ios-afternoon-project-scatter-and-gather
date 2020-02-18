//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Tobi Kuyoro on 18/02/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Properties
    
    var isScattered: Bool = false
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBarButton()
        setUpLabels()
    }
    
    // MARK: - Private
    
    private func setUpBarButton() {
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
        navigationItem.rightBarButtonItem = toggleButton
    }
    
    private func setUpLabels() {
        
        // "L" Label
        let lLabel = UILabel()
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 60)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "A1" Label
        let a1Label = UILabel()
        a1Label.text = "A"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 60)
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        
        // "M" Label
        let mLabel = UILabel()
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 60)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "B" Label
        let bLabel = UILabel()
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 60)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "D" Label
        let dLabel = UILabel()
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 60)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "A2" Label
        let a2Label = UILabel()
        a2Label.text = "A"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 60)
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(a1Label)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(a2Label)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
        
    }
    
    // MARK: - Actions
    
    @objc func toggleButtonPressed() {
        
    }
}

