//
//  ViewController.swift
//  ScatterAndGatheriOS17
//
//  Created by Stephanie Ballard on 5/12/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
    
    @IBOutlet weak var letterLTextLabel: UILabel!
    @IBOutlet weak var letterATextLabel: UILabel!
    @IBOutlet weak var letterMTextLabel: UILabel!
    @IBOutlet weak var letterBTextLabel: UILabel!
    @IBOutlet weak var letterDTextLabel: UILabel!
    @IBOutlet weak var secondLetterATextLabel: UILabel!
    @IBOutlet weak var lambdaImage: UIImageView!
    
    @IBOutlet var lambdaLetters: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        
        startAnimations()
    }
    
    func startAnimations() {
        
    }

}

