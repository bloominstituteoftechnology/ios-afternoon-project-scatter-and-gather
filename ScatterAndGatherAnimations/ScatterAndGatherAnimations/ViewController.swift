//
//  ViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Bhawnish Kumar on 3/17/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    
    enum scatOrGat: String {
        case scattered = "Scattered"
        case gathered = "Gathered"
    }
   let someImageView: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "lambda_logo.png")
       theImageView.translatesAutoresizingMaskIntoConstraints = false 
       return theImageView
    }()

    override func viewDidLoad() {
       super.viewDidLoad()
       someImageViewConstraints()
    }

    func someImageViewConstraints() {
          view.addSubview(someImageView)
        someImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }

    
    var isScattered: Bool?
   
    @IBAction func toggleButtonPressed(_ sender: Any) {
    }
    
    

}

