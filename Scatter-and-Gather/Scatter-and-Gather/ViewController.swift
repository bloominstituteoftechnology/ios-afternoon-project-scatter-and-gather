//
//  ViewController.swift
//  Scatter-and-Gather
//
//  Created by Lambda_School_Loaner_201 on 11/14/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered = false
    var labels: [UILabel] = []
    
    var charLOriginPoint: CGPoint!
    var charAOriginPoint: CGPoint!
    var charMOriginPoint: CGPoint!
    var charBOriginPoint: CGPoint!
    var charDOriginPoint: CGPoint!
    var charAAOriginPoint: CGPoint!

    
    @IBOutlet weak var letterLLabel: UILabel!
    
    @IBOutlet weak var letter1ALabel: UILabel!
    
    @IBOutlet weak var letterMLabel: UILabel!
    
    @IBOutlet weak var letterBLabel: UILabel!
    
    @IBOutlet weak var letterDLabel: UILabel!
    
    @IBOutlet weak var letter2ALabel: UILabel!
    
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    
    
    
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        if isScattered {
            gather()
        } else {
            scatter()
        }

         // Call toggle to switch bool after clicked
        isScattered.toggle()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabelPointOrigins()
        lambdaLogoImageView.isOpaque = false
    }

     private func setLabelPointOrigins() {
        charLOriginPoint = self.letterLLabel.center
        charAOriginPoint = self.letter1ALabel.center
        charMOriginPoint = self.letterMLabel.center
        charBOriginPoint = self.letterBLabel.center
        charDOriginPoint = self.letterDLabel.center
        charAAOriginPoint = self.letter2ALabel.center
    }
    
    

         // MARK: - Actions
        
        private func scatter() {

            self.letterLLabel.textColor = randomColor()
            self.letter1ALabel.textColor = randomColor()
            self.letterMLabel.textColor = randomColor()
            self.letterBLabel.textColor = randomColor()
            self.letterDLabel.textColor = randomColor()
            self.letter2ALabel.textColor = randomColor()

    
            UIView.animate(withDuration: 2.0) {
                self.letterLLabel.center = self.randomPoint(from: self.letterLLabel)
                self.letterLLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterLLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letter1ALabel.center = self.randomPoint(from: self.letter1ALabel)
                self.letter1ALabel.layer.backgroundColor = self.randomColor().cgColor
                self.letter1ALabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterMLabel.center = self.randomPoint(from: self.letterMLabel)
                self.letterMLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterMLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterBLabel.center = self.randomPoint(from: self.letterBLabel)
                self.letterBLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterBLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterDLabel.center = self.randomPoint(from: self.letterDLabel)
                self.letterDLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterDLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letter2ALabel.center = self.randomPoint(from: self.letter2ALabel)
                self.letter2ALabel.layer.backgroundColor = self.randomColor().cgColor
                self.letter2ALabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.lambdaLogoImageView.alpha = 0.0
            }

         }

         private func randomAngle() -> CGFloat {
            let angle = CGFloat(Int.random(in: 1...10))
            if (Int.random(in: 1...100) % 2) == 0 {
                return CGFloat.pi / angle
            } else {
                return -1 * CGFloat.pi / angle
            }
        }

         private func randomPoint(from label: UILabel) -> CGPoint {

             let minX = Int(view.bounds.minX)
            var maxX = Int(view.bounds.maxX)
            let minY = Int(view.bounds.minY)
            var maxY = Int(view.bounds.maxY)

             let labelHeight = Int(label.bounds.size.height)
            let labelWidth = Int(label.bounds.size.width)

             maxX = maxX - labelWidth
            maxY = maxY - labelHeight

             let randXPoint = CGFloat(Int.random(in: minX...maxX))
            let randYPoint = CGFloat(Int.random(in: minY...maxY))
            return CGPoint(x: randXPoint, y: randYPoint)
        }

         private func randomColor() -> UIColor {
            let randNum = Int.random(in: 0...6)
            switch randNum {
            case 0:
                return UIColor.red
            case 1:
                return UIColor.blue
            case 2:
                return UIColor.brown
            case 3:
                return UIColor.cyan
            case 4:
                return UIColor.green
            case 5:
                return UIColor.yellow
            case 6:
                return UIColor.orange
            default:
                return UIColor.black
            }
        }
    

         private func gather() {

             self.letterLLabel.textColor = UIColor.black
            self.letter1ALabel.textColor = UIColor.black
            self.letterMLabel.textColor = UIColor.black
            self.letterBLabel.textColor = UIColor.black
            self.letterDLabel.textColor = UIColor.black
            self.letter2ALabel.textColor = UIColor.black

             UIView.animate(withDuration: 2.0) {
                self.letterLLabel.center = self.charLOriginPoint
                self.letterLLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.letterLLabel.transform = .identity

                 self.letter1ALabel.center = self.charAOriginPoint
                self.letter1ALabel.layer.backgroundColor = UIColor.clear.cgColor
                self.letter1ALabel.transform = .identity

                 self.letterMLabel.center = self.charMOriginPoint
                self.letterMLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.letterMLabel.transform = .identity

                 self.letterBLabel.center = self.charBOriginPoint
                self.letterBLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.letterBLabel.transform = .identity

                 self.letterDLabel.center = self.charDOriginPoint
                self.letterDLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.letterDLabel.transform = .identity

                 self.letter2ALabel.center = self.charAAOriginPoint
                self.letter2ALabel.layer.backgroundColor = UIColor.clear.cgColor
                self.letter2ALabel.transform = .identity

                 self.lambdaLogoImageView.alpha = 1.0
            }
        }

     }
