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
        lambdaImage.alpha = 0
        UIView.animate(withDuration: 2.5) {
            self.lambdaImage.alpha = 1
        }
        
        for letter in self.lambdaLetters {
            letter.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.7...1))
            
        }
        
        for letter in self.lambdaLetters {
            letter.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.7...1))
        }
        
        for letter in self.lambdaLetters {
            letter.center.x = CGFloat.random(in: 0..<view.bounds.size.width/1.5)
            letter.center.y = CGFloat.random(in: 0..<view.bounds.height/1.5)
            
        }
    }
    
}

