//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Enrique Gongora on 2/18/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Image
    var imageView: UIImageView!
    
    //MARK: - IBAction
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        var isScattered: Bool
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
    }
    
    func viewSetUp() {
        
        //Image
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        self.imageView = imageView
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 1.5).isActive = true
    }
}

