//
//  ViewController.swift
//  lambda scatter
//
//  Created by Elizabeth Wingate on 2/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var letterLLabel: UILabel!
    @IBOutlet weak var letterALabel: UILabel!
    @IBOutlet weak var letterMLabel: UILabel!
    @IBOutlet weak var letterBLabel: UILabel!
    @IBOutlet weak var letterDLabel: UILabel!
    @IBOutlet weak var secondLetterALabel: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!

    var isScattered = false
    var labels: [UILabel] = []
    
    var lOrigin: CGPoint!
    var aOrigin: CGPoint!
    var mOrigin: CGPoint!
    var bOrigin: CGPoint!
    var dOrigin: CGPoint!
    var a2Origin: CGPoint!

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
         super.viewDidLoad()
         setLabelPointOrigins()
         lambdaLogo.isOpaque = false
     }
    
    private func setLabelPointOrigins() {
         lOrigin = self.letterLLabel.center
         aOrigin = self.letterALabel.center
         mOrigin = self.letterMLabel.center
         bOrigin = self.letterBLabel.center
         dOrigin = self.letterDLabel.center
         a2Origin = self.secondLetterALabel.center
         
     }
    
    // MARK: - Private
    
     private func scatter() {
        self.lambdaLogo.alpha = 0.0 // Fades out image
        
        self.letterLLabel.textColor = randomColor()
        self.letterALabel.textColor = randomColor()
        self.letterMLabel.textColor = randomColor()
        self.letterBLabel.textColor = randomColor()
        self.letterDLabel.textColor = randomColor()
        self.secondLetterALabel.textColor = randomColor()
        
        UIView.animate(withDuration: 2.0) {
                self.lambdaLogo.alpha = 0.0
                self.letterLLabel.center = self.randomPoint(from: self.letterLLabel)
                self.letterLLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterLLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterALabel.center = self.randomPoint(from: self.letterALabel)
                self.letterALabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterALabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterMLabel.center = self.randomPoint(from: self.letterMLabel)
                self.letterMLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterMLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterBLabel.center = self.randomPoint(from: self.letterBLabel)
                self.letterBLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterBLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.letterDLabel.center = self.randomPoint(from: self.letterDLabel)
                self.letterDLabel.layer.backgroundColor = self.randomColor().cgColor
                self.letterDLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
                self.secondLetterALabel.center = self.randomPoint(from: self.secondLetterALabel)
                self.secondLetterALabel.layer.backgroundColor = self.randomColor().cgColor
                self.secondLetterALabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                
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
           
            _ = Int(label.bounds.size.height)
           let labelWidth = Int(label.bounds.size.width)
           
           maxX = maxX - labelWidth
           maxY = maxY - labelWidth
           
           let randXPoint = CGFloat(Int.random(in: minX...maxX))
           let randYPoint = CGFloat(Int.random(in: minY...maxY))
           return CGPoint(x: randXPoint, y: randYPoint)
       }
    
    private func randomColor() -> UIColor {
        let randNum = Int.random(in: 0...5)
        switch randNum {
        case 0:
            return UIColor.red
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.brown
        case 3:
            return UIColor.orange
        case 4:
            return UIColor.green
        case 5:
            return UIColor.yellow
        default:
            return UIColor.black
            
        }
    }
     private func gather() {
           self.lambdaLogo.alpha = 1.0 // Fades in image
       }
       
    
    
    
    
 // MARK: - Actions
   @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            gather()
        } else {
            scatter()
            
        }
        
        isScattered.toggle()
    }
}
