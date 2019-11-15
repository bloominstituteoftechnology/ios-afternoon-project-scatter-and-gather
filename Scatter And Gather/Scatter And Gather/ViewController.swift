//
//  ViewController.swift
//  Scatter And Gather
//
//  Created by Joseph Rogers on 11/15/19.
//  Copyright © 2019 Moka Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    var isScattered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
     
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButton(_:)))
        
        
    }
    
    
    @objc func toggleButton(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        print("\(isScattered)")
    }

}
