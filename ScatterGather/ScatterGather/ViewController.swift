//
//  ViewController.swift
//  ScatterGather
//
//  Created by Jeremy Taylor on 5/22/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var endALabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var isScattered = false
    
    var originalX: [CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered {
            gather()
        } else {
            scatter()
        }
        isScattered.toggle()
    }
    
    func scatter() {
        UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.logoImageView.alpha = 0
            self.moveLetters()
            self.rotate()
        }, completion: nil)
    }
    
    func gather() {
        UIView.animate(withDuration: 4) {
            self.logoImageView.alpha = 1
            UIView.animate(withDuration: 4, animations: {
                self.reset()
            })
        }
    }
    
    func moveLetters() {
        let letters = [lLabel, aLabel, mLabel, bLabel, dLabel, endALabel]
        for letter in letters {
            letter?.translatesAutoresizingMaskIntoConstraints = false
            originalX.append((letter?.frame.origin.x)!)
//            print(view.frame.maxX)
//            print(view.frame.maxY)
            let randomX = CGFloat(Int.random(in: Int(view.frame.minX)...Int(view.frame.maxX)))
            let randomY = CGFloat(Int.random(in: Int(view.frame.minY)...Int(view.frame.maxY)))
            let point = CGPoint(x: randomX, y: randomY)
            
            letter?.frame.origin.x = point.x
            letter?.frame.origin.y = point.y
            
            letter?.backgroundColor = getRandomColor()
            letter?.textColor = getRandomColor()
            letter?.layer.shadowOpacity = 0.5
        }
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func rotate() {
        let randomAngle = arc4random_uniform(361) + 360
        let letters = [lLabel, aLabel, mLabel, bLabel, dLabel, endALabel]
        for letter in letters {
            letter?.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle))
        }
    }
    
    func reset() {
        let letters = [lLabel, aLabel, mLabel, bLabel, dLabel, endALabel]
        for letter in letters.enumerated() {
            letter.element?.backgroundColor = .white
            letter.element?.textColor = UIColor.black
            letter.element?.transform = CGAffineTransform.identity
            letter.element?.frame.origin.y = 0.0
            letter.element?.frame.origin.x = originalX[letter.offset]
            letter.element?.layer.shadowOpacity = 0.0
        }
    }
}

