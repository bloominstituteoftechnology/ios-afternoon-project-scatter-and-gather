//
//  ViewController.swift
//  Scatter+Gather
//
//  Created by Lisa Sampson on 5/15/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties and Outlets
    var shouldScramble: Bool = false
    let colorArray = [UIColor.red, UIColor.orange, UIColor.blue, UIColor.cyan, UIColor.purple, UIColor.green, UIColor.magenta, UIColor.yellow]
    private var labels: [UILabel] = []
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lambdaL: UILabel!
    @IBOutlet weak var lambdaA: UILabel!
    @IBOutlet weak var lambdaM: UILabel!
    @IBOutlet weak var lambdaB: UILabel!
    @IBOutlet weak var lambdaD: UILabel!
    @IBOutlet weak var lambdA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels = [lambdaL, lambdaA, lambdaM, lambdaB, lambdaD, lambdA]
        
        view.addSubview(lambdaL)
        view.addSubview(lambdaA)
        view.addSubview(lambdaM)
        view.addSubview(lambdaB)
        view.addSubview(lambdaD)
        view.addSubview(lambdA)
        view.addSubview(logo)
    }

    @IBAction func toggle(_ sender: Any) {
        
        if shouldScramble == false {
            UIView.animate(withDuration: 3.0) {
                self.logo.alpha = 0.0
                
                for label in self.labels {
                    let index = Int(arc4random_uniform(UInt32(self.colorArray.count)))
                    label.textColor = self.colorArray[index]
                    let backgroundIndex = Int(arc4random_uniform(UInt32(self.colorArray.count)))
                    label.layer.backgroundColor = self.colorArray[backgroundIndex].cgColor
                }
            }
            
            shouldScramble = true
        } else {
            UIView.animate(withDuration: 3.0) {
                self.logo.alpha = 1.0
                
                for label in self.labels {
                    label.textColor = .black
                    label.layer.backgroundColor = UIColor.clear.cgColor
                }
            }
            
            shouldScramble = false
        }
    }
    
}

