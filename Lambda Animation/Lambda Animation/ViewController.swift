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
    var lambda : UIView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        configureNavBar()
    }
    
    
    
    
    fileprivate func configureNavBar() {
          title = "Lambda Hello"
          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
    }
    
    @objc func toggleButtonPressed() {
        
    }

    
    fileprivate func setUpSubviews() {
        
        let l : UILabel = {
           let label = UILabel()
            label.text = "L"
            label.font = UIFont(name: "Noteworthy-Light", size: 40)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(l)
        let a : UILabel = {
               let label = UILabel()
                label.text = "a"
                label.font = UIFont(name: "Noteworthy-Light", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        
        view.addSubview(a)
        let m : UILabel = {
               let label = UILabel()
                label.text = "m"
                label.font = UIFont(name: "Noteworthy-Light", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(m)
        let b : UILabel = {
               let label = UILabel()
                label.text = "b"
                label.font = UIFont(name: "Noteworthy-Light", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(b)
        
        let d : UILabel = {
               let label = UILabel()
                label.text = "d"
                label.font = UIFont(name: "Noteworthy-Light", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(d)
        
        let a2 : UILabel = {
               let label = UILabel()
                label.text = "a"
                label.font = UIFont(name: "Noteworthy-Light", size: 40)
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
        self.lambda = lambdaStackView
        NSLayoutConstraint.activate([
            lambdaStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lambdaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lambdaStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lambdaStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
     
        ])
       
        
        let lambdaImageView: UIImageView = {
           let imageView = UIImageView(image: #imageLiteral(resourceName: "lambda_logo"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
            
        }()
        
        view.addSubview(lambdaImageView)
        
        NSLayoutConstraint.activate([
            lambdaImageView.topAnchor.constraint(equalTo: lambdaStackView.bottomAnchor, constant: 50),
            lambdaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lambdaImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        
        
        
        
    }

}

