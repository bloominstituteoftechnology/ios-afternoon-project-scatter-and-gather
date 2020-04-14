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
    var isChained: Bool = false
    
    var originalX = CGFloat()
    var originalY = CGFloat()
    
    var colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemOrange, .systemPurple, .systemTeal, .systemIndigo, .systemPink, .systemGray, .systemYellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letters = [ L, A, M, B, D, A2 ]
        originalX = L.center.x
        originalY = L.center.y
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if !isScattered {
            scatter(); isScattered = true
        } else {
            collect(); isScattered = false
        }
    }
    
    func scatter() {
        // Fade out image
        UIView.animate(withDuration: 2.0, animations: {
            self.image.alpha = 0.0
        })
        
        // Scatter Letters
        for letter in letters {
            letter.textColor = colors[Int.random(in: 0...(colors.count-1))]
            UIView.animate(withDuration: 2.0, animations: {
                letter.transform = CGAffineTransform(rotationAngle: CGFloat(.pi/(Float.random(in: 0 ..< 3.5))))
                letter.center.x = CGFloat(Int.random(in: 20...250))
                letter.center.y = CGFloat(Int.random(in: 260...640))
            }, completion: nil)
        }
        
    }
    
    func collect() {
        // Bring back image
        UIView.animate(withDuration: 2.0, animations: {
            self.image.alpha = 1.0
        })
        
        // Reset Letters
        var i = 0
        for letter in letters {
            letter.textColor = .black;
            UIView.animate(withDuration: 2.0) {
                letter.transform = .identity
                letter.center.x = self.originalX + CGFloat(50*i)
                letter.center.y = self.originalY
            }
            i += 1
        }
    }
    
    @IBAction func chainButtonPressed(_ sender: UIBarButtonItem) {
        if !isChained {
            chainButton.title = "Chain Animations ✅"
            isChained = true
        } else {
            chainButton.title = "Chain Animations ❌"
            isChained = false
        }
    }
}
