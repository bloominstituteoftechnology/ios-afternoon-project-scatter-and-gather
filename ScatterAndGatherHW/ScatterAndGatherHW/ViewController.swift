//
//  ViewController.swift
//  ScatterAndGatherHW
//
//  Created by Michael Flowers on 5/15/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble = true
    var labelArray = [UILabel]()
    var colors: [UIColor] = [
        .blue,
        .black,
        .cyan,
        .orange,
        .purple,
        .magenta,
        .brown,
        .darkGray,
        .gray,
        .green,
        .lightGray,
        .red,
        .yellow
        
    ]
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var alLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelArray += [
            lLabel,
            alLabel,
            mLabel,
            bLabel,
            dLabel,
            lastALabel
        ]
    }
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        
        //let random numbers
        
        UIView.animate(withDuration: 4, animations: {
            if self.shouldScramble {
                self.imageView.alpha = 0
                for i in self.labelArray {
                    let randomX = CGFloat.random(in: -10...10)
                    let randomY = CGFloat.random(in: -20...20)
                    let fontSize = CGFloat.random(in: 0...100)
                    i.transform = CGAffineTransform(scaleX: randomX, y: -randomY)
                    i.transform = CGAffineTransform(rotationAngle: randomY)
                    i.transform = CGAffineTransform(translationX: randomX, y: randomY)
                    i.layer.borderWidth = CGFloat(randomX)
                    i.textColor = self.colors.randomElement()
                    i.backgroundColor = self.colors.randomElement()
                    i.font = .systemFont(ofSize: fontSize)
                }
                self.shouldScramble = false
            } else {
                for label in self.labelArray {
                    label.transform = .identity
                }
                self.imageView.alpha = 1
                self.shouldScramble = true
            }
        })
    }
    
}
