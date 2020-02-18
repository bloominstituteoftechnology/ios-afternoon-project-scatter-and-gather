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
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Properties
    
    var isScattered: Bool = false

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    // MARK: - Private

    private func setUpSubviews() {
        
        // Bar Button Item
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
        navigationItem.rightBarButtonItem = toggleButton
        
        // "L" Label
        let lLabel = UILabel()
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 60)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lLabel = lLabel
        
        // "A1" Label
        let a1Label = UILabel()
        a1Label.text = "A"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 60)
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        self.a1Label = a1Label
        
        // "M" Label
        let mLabel = UILabel()
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 60)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mLabel = mLabel
        
        // "B" Label
        let bLabel = UILabel()
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 60)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bLabel = bLabel
        
        // "D" Label
        let dLabel = UILabel()
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 60)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dLabel = dLabel
        
        // "A2" Label
        let a2Label = UILabel()
        a2Label.text = "A"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 60)
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        self.a2Label = a2Label
        
        // StackView
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        view.addSubview(stackView)
        self.stackView = stackView
        
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

