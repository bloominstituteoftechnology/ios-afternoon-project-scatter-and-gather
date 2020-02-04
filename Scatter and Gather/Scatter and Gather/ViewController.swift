//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Kevin Stewart on 1/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var image: Image?
    private var stackView: UIStackView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureStackView()
        configureLabels()
        updateViews()
    }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
        }

    // MARK: - Programmatic Constraints
    
    private func updateViews() {
       
    }
    

    private func configureStackView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private func configureLabels() {
        
        
        // Labels
        let lLabel = UILabel()
            lLabel.translatesAutoresizingMaskIntoConstraints = false
            lLabel.textAlignment = .center
            lLabel.text = "L"
            lLabel.font = UIFont.systemFont(ofSize: 50)
        stackView?.addSubview(lLabel)
            
        
        let a1Label = UILabel()
            a1Label.translatesAutoresizingMaskIntoConstraints = false
            a1Label.textAlignment = .center
            a1Label.text = "A"
            a1Label.font = UIFont.systemFont(ofSize: 50)
            stackView?.addSubview(a1Label)
            
        
        let mLabel = UILabel()
            mLabel.translatesAutoresizingMaskIntoConstraints = false
            mLabel.textAlignment = .center
            mLabel.text = "M"
            mLabel.font = UIFont.systemFont(ofSize: 50)
            stackView?.addSubview(mLabel)
            
        
        let bLabel = UILabel()
            bLabel.translatesAutoresizingMaskIntoConstraints = false
            bLabel.textAlignment = .center
            bLabel.text = "B"
            bLabel.font = UIFont.systemFont(ofSize: 50)
            stackView?.addSubview(bLabel)
            
        
        let dLabel = UILabel()
            dLabel.translatesAutoresizingMaskIntoConstraints = false
            dLabel.textAlignment = .center
            dLabel.text = "D"
            dLabel.font = UIFont.systemFont(ofSize: 50)
            stackView?.addSubview(dLabel)
            
        
        let a2Label = UILabel()
            a2Label.translatesAutoresizingMaskIntoConstraints = false
            a2Label.textAlignment = .center
            a2Label.text = "A"
            a2Label.font = UIFont.systemFont(ofSize: 50)
            stackView?.addSubview(a2Label)
            
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = image?.image
        view.addSubview(imageView)
        
        
        
//        // MARK: - L label constraints
//
//        NSLayoutConstraint(item: lLabel,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//        NSLayoutConstraint(item: lLabel,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 10).isActive = true
//        NSLayoutConstraint(item: lLabel,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .trailing,
//                           multiplier: 1,
//                           constant: -10).isActive = true
//
//
//
//        // MARK: - A1 label constraints
//        NSLayoutConstraint(item: a1Label,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//        NSLayoutConstraint(item: a1Label,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 25).isActive = true
//        NSLayoutConstraint(item: a1Label,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .trailing,
//                           multiplier: 1,
//                           constant: -25).isActive = true
//
//        // MARK: - M label constraints
//        NSLayoutConstraint(item: mLabel,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//        NSLayoutConstraint(item: mLabel,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 50).isActive = true
//        NSLayoutConstraint(item: mLabel,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .trailing,
//                           multiplier: 1,
//                           constant: -50).isActive = true
//        // MARK: - B label constraints
//        NSLayoutConstraint(item: bLabel,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//        NSLayoutConstraint(item: bLabel,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 70).isActive = true
//        NSLayoutConstraint(item: bLabel,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .trailing,
//                           multiplier: 1,
//                           constant: -70).isActive = true
//        // MARK: - D label constraints
//        NSLayoutConstraint(item: dLabel,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//        NSLayoutConstraint(item: dLabel,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//        NSLayoutConstraint(item: dLabel,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .trailing,
//                           multiplier: 1,
//                           constant: -100).isActive = true
//        // MARK: - A2 label constraints
//        NSLayoutConstraint(item: a2Label,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//        NSLayoutConstraint(item: a2Label,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 130).isActive = true
//        NSLayoutConstraint(item: a2Label,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: view.safeAreaLayoutGuide,
//                           attribute: .trailing,
//                           multiplier: 1,
//                           constant: -130).isActive = true
        
        // MARK: - Image View
     let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 100).isActive = true
       let imageViewLeadingConstriant = NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 25).isActive = true
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -25).isActive = true



    }









    // MARK: - Actions
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        var isScattered: Bool
        
    }









}


