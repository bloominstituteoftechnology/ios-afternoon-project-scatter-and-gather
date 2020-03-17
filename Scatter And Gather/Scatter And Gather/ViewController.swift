//
//  ViewController.swift
//  Scatter And Gather
//
//  Created by Wyatt Harrell on 3/17/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLabel2: UILabel!
    
    let imageView = UIImageView()
    var isToggled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()
    }

    func setUpImageView() {
        imageView.image = UIImage(named: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        if isToggled {
            
            
            
            UIView.animate(withDuration: 2.0) {
                self.imageView.layer.opacity = 0
                print("s")
            }
            
            
            
            
            
            
            
            
            isToggled = false
        } else {
            isToggled = true
            
            
            UIView.animate(withDuration: 2.0) {
                self.imageView.layer.opacity = 1
            }
        }
        
        
        
        
        
    }
}

