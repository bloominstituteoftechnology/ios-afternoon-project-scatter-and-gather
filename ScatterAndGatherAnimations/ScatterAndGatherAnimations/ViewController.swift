//
//  ViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Bhawnish Kumar on 3/17/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

enum scatOrGat: String {
       case scattered = "Scattered"
       case gathered = "Gathered"
   }
class ViewController: UIViewController {
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    
   
    var isScattered: Bool?
    //MARK: Lambda Image View Property
   let lambdaImageView: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "lambda_logo.png")
       theImageView.translatesAutoresizingMaskIntoConstraints = false 
       return theImageView
    }()
     

    override func viewDidLoad() {
       super.viewDidLoad()
       someImageViewConstraints()
        
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
    }
//     MARK: Lambda Image View Function
    func someImageViewConstraints() {
           view.addSubview(lambdaImageView)
         lambdaImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
         lambdaImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
         lambdaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         lambdaImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
     }

}

