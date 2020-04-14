//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by conner on 4/14/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var L: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var M: UILabel!
    @IBOutlet weak var B: UILabel!
    @IBOutlet weak var D: UILabel!
    @IBOutlet weak var A2: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var chainButton: UIBarButtonItem!
    var letters: [UILabel] = [UILabel()]
    var isScattered: Bool = false
    var chained: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letters = [ L, A, M, B, D, A2 ]
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if !isScattered {
            for letter in letters {
                UIView.animate(withDuration: 2.0, animations: {
                    letter.transform = CGAffineTransform(rotationAngle: CGFloat(.pi/(Float.random(in: 0 ..< 3.5))))
                }, completion: nil)
            }
            isScattered = true;
        } else {
            for letter in letters {
                UIView.animate(withDuration: 2.0) {
                    letter.transform = .identity
                }
            }
            isScattered = false;
        }
    }
    
    @IBAction func chainButtonPressed(_ sender: UIBarButtonItem) {
        if !chained {
            chainButton.title = "Chain Animations ✅"
            chained = true
        } else {
            chainButton.title = "Chain Animations ❌"
            chained = false
        }
    }
}
