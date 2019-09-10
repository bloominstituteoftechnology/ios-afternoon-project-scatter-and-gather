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
    
    var label = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        
        // Sample code from YouTube to test why my labels aren't working.
        label.frame = CGRect(x: 0, y: 600, width: self.view.frame.width, height: 120)
        label.text = "Welcome to My Channel"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.darkGray
        label.font = UIFont(name: "Copperplate-Bold", size: 22)
        
        self.view.addSubview(label)
    }
    
    
    func setUpSubViews() {
        
        
        let letter1 = UILabel()
        letter1.translatesAutoresizingMaskIntoConstraints = false
        letter1.text = "Hello"
        view.addSubview(letter1)
        
        letter1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true



    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        
    }
}

