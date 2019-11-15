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
        // Do any additional setup after loading the view.
    }
    
    func createNavItems() {
        let toggleButton = UIBarButtonItem()
        toggleButton.title = "Toggle"
        self.navigationItem.setRightBarButton(toggleButton, animated: true)
    }

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        isScattered.toggle()
        
        print("\(isScattered)")

}
    
    @objc func toggleButton(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        print("\(isScattered)")
    }

}
