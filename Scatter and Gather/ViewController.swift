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
    
    private var letter1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }
    
    
    private func setUpSubViews() {
        
        let letter1 = UILabel()
        letter1.translatesAutoresizingMaskIntoConstraints = false
        letter1.text = "Hello"
        view.addSubview(letter1)
        
        self.letter1 = letter1
        
        
        let letter2 = UILabel()
        letter2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter2)
        
        let letter3 = UILabel()
        letter3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter3)
        
        let letter4 = UILabel()
        letter4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter4)
        
        let letter5 = UILabel()
        letter5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter5)
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        
    }
}

