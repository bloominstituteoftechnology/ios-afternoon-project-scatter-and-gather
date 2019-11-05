//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by morse on 11/5/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    // MARK: - Properties
    
    private var isScattered: Bool = false
    var label1Origin: CGPoint!
    var label2Origin: CGPoint!
    var label3Origin: CGPoint!
    var label4Origin: CGPoint!
    var label5Origin: CGPoint!
    var label6Origin: CGPoint!

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        establishOrigins()
    }

    // MARK: - Actions
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        let duration = 1.0
        let letters = [label1, label2, label3, label4, label5, label6]
        fadeImage(withDuration: duration, for: isScattered)
        _ = letters.compactMap {
            guard let letter = $0 else { return }
            scatterLetter(letter, for: duration, in: isScattered)
        }
        isScattered.toggle()
    }
    
    func fadeImage(withDuration duration: Double, for direction: Bool) {
        switch direction {
        case true:
            UIView.animate(withDuration: duration) {
                self.logo.alpha = 1
            }
        case false:
            UIView.animate(withDuration: duration) {
                self.logo.alpha = 0
            }
        }
    }
    
    func scatterLetter(_ letter: UILabel, for duration: Double, in direction: Bool) {
        switch direction {
        case true:
            UIView.animate(withDuration: duration) {
                letter.layer.backgroundColor = .none
                letter.textColor = .black
                letter.transform = CGAffineTransform(rotationAngle: 0)
                switch letter {
                case self.label1: letter.center = self.label1Origin
                case self.label2: letter.center = self.label2Origin
                case self.label3: letter.center = self.label3Origin
                case self.label4: letter.center = self.label4Origin
                case self.label5: letter.center = self.label5Origin
                case self.label6: letter.center = self.label6Origin
                default:
                    return
                }
            }
        case false:
            let randomX = Int.random(in: 0...Int(view.bounds.size.width - letter.frame.size.width))
            let randomY = Int.random(in: 0...Int(view.bounds.size.height - letter.frame.size.height))
            let letterColor = UIColor(
                displayP3Red: CGFloat(Int.random(in: 0...100))/100,
                green: CGFloat(Int.random(in: 0...100))/100,
                blue: CGFloat(Int.random(in: 0...100))/100,
                alpha: 1)
           
            let randomAngle = CGFloat(Int.random(in: 0...360))
//            letter.alpha = 0
            
            let backgroundColor = CGColor(
                srgbRed: CGFloat(Int.random(in: 0...100))/100,
                green: CGFloat(Int.random(in: 0...100))/100,
                blue: CGFloat(Int.random(in: 0...100))/100,
                alpha: 1)
            
            UIView.animate(withDuration: duration) {
                letter.center = CGPoint(x: randomX, y: randomY)
                letter.textColor = letterColor
                letter.layer.backgroundColor = backgroundColor
//                letter.alpha = 1
                letter.transform = CGAffineTransform(rotationAngle: randomAngle)
            }
        }
    }
    
    private func establishOrigins() {
        if !isScattered {
            label1Origin = label1.center
            label2Origin = label2.center
            label3Origin = label3.center
            label4Origin = label4.center
            label5Origin = label5.center
            label6Origin = label6.center
        }
    }
    
}

