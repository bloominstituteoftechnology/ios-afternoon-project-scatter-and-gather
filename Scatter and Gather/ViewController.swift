//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Andrew Ruiz on 9/10/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

// Testing Github

class ViewController: UIViewController {
    
    let isScattered : Bool = false
    
    var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }
    
    
    func setUpSubViews() {
        
        // Adding imageView
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.image = UIImage(named: "lambda_logo")
        
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
        
        self.imageView = imageView
        
        
        let letter1 = UILabel()
        letter1.translatesAutoresizingMaskIntoConstraints = false
        letter1.text = "L"
        view.addSubview(letter1)
        
        let letter1TopConstraint = NSLayoutConstraint(item: letter1,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: view.safeAreaLayoutGuide,
                                                         attribute: .top,
                                                         multiplier: 1,
                                                         constant: 20)
        
        let letter1LeftConstraint = NSLayoutConstraint(item: letter1,
                                                      attribute: .left,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .left,
                                                      multiplier: 1,
                                                      constant: 20)
        
        NSLayoutConstraint.activate([letter1TopConstraint, letter1LeftConstraint])

    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        
    }
}

