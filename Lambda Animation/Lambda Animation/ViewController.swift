//
//  ViewController.swift
//  Lambda Animation
//
//  Created by Nick Nguyen on 2/18/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Properties
    
    private(set) var isScattered = false

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        configureNavBar()
    }
    
    
    
    
    private func configureNavBar() {
          title = "Lambda Hello"
          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
    }
    
    @objc func toggleButtonPressed() {
        
    }

    
    private func setUpSubviews() {
        
        let l : UILabel = {
           let label = UILabel()
            label.text = "L"
            label.font = UIFont.boldSystemFont(ofSize: 40)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(l)
        let a : UILabel = {
               let label = UILabel()
                label.text = "A"
                label.font = UIFont.boldSystemFont(ofSize: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        
        view.addSubview(a)
        let m : UILabel = {
               let label = UILabel()
                label.text = "M"
                label.font = UIFont.boldSystemFont(ofSize:40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(m)
        let b : UILabel = {
               let label = UILabel()
                label.text = "B"
                label.font = UIFont.boldSystemFont(ofSize: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(b)
        
        let d : UILabel = {
               let label = UILabel()
                label.text = "D"
                label.font = UIFont.boldSystemFont(ofSize: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(d)
        
        let a2 : UILabel = {
               let label = UILabel()
                label.text = "A"
                label.font = UIFont.boldSystemFont(ofSize: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(a2)
     
        let lambdaStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(l)
            stackView.addArrangedSubview(a)
            stackView.addArrangedSubview(m)
            stackView.addArrangedSubview(b)
            stackView.addArrangedSubview(d)
            stackView.addArrangedSubview(a2)
            stackView.alignment = .fill
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        view.addSubview(lambdaStackView)
        
        NSLayoutConstraint.activate([
            lambdaStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lambdaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lambdaStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lambdaStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
     
        ])
    }

}

