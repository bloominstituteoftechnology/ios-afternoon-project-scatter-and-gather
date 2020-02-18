//
//  MainViewController.swift
//  ScatterAndGather
//
//  Created by Lambda_School_Loaner_268 on 2/18/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
          super.viewDidLoad()

          // Do any additional setup after loading the view.
      }
    
    var isScattered: Bool = false
    
    // MARK: - ACTIONS
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        mechanism()
        isScattered = !isScattered
        }
    }
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var L: UILabel!
    
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var D: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var M: UILabel!
    @IBOutlet weak var B: UILabel!
    
    @IBOutlet weak var letterStack: UIStackView!
    @IBOutlet weak var logoIV: UIImageView!
    
    // MARK: - METHODS
    
    func mechanism() {
    
        // Position Random Numbers
        var randomNum1: [(CGFloat, CGFloat)] = []
        for _ in 1...6 {
            let x = CGFloat(Int.random(in: 1...250))
            let y = CGFloat(Int.random(in: 1...250))
            let t = (x, y)
            randomNum1.append(t)
        }
        
        // Color Random Numbers
        var randomColorNumbers: [(CGFloat, CGFloat, CGFloat, CGFloat)] = []
        
        for _ in 1...6 {
            let red = CGFloat(Float(Int.random(in: 1...10)) * 0.1)
            let green = CGFloat(Float(Int.random(in: 1...10)) * 0.1)
            let blue = CGFloat(Float(Int.random(in: 1...10)) * 0.1)
            let alpha = CGFloat(Float(Int.random(in: 1...10)) * 0.1)
            randomColorNumbers.append((red, green, blue, alpha))
        }
        
        // Rotation Random Numbers
        var randomRotationNumber: [CGFloat] = []
        
        for _ in 1...6 {
            randomRotationNumber.append(CGFloat(Int.random(in: 1...360)))
        }
        
        
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.50) {
                
                // Start shrinking the  logo
                self.logoIV.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                // Move L
                self.L.center = CGPoint(x: randomNum1[0].0, y: randomNum1[0].1)
                // Change L Color
                self.L.textColor = UIColor(red: randomColorNumbers[0].0, green: randomColorNumbers[0].1, blue: randomColorNumbers[0].2, alpha: randomColorNumbers[0].3)
                // Start Rotating L
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[0] / 3)
                // Move A
                self.A.center = CGPoint(x: randomNum1[1].0, y: randomNum1[1].1)
                // Change A Color
                self.A.textColor = UIColor(red: randomColorNumbers[1].0, green: randomColorNumbers[1].1, blue: randomColorNumbers[1].2, alpha: randomColorNumbers[1].3)
                // Start Rotating A
                self.A.transform = CGAffineTransform(rotationAngle: randomRotationNumber[1] / 3)
                // Move M
                self.M.center = CGPoint(x: randomNum1[2].0, y: randomNum1[2].1)
                // Change M colo
                self.M.textColor = UIColor(red: randomColorNumbers[2].0, green: randomColorNumbers[2].1, blue: randomColorNumbers[2].2, alpha: randomColorNumbers[2].3)
                // Start Rotating M
                self.M.transform = CGAffineTransform(rotationAngle: randomRotationNumber[2] / 3)
                // Move B
                self.B.center = CGPoint(x: randomNum1[3].0, y: randomNum1[3].1)
                // Change B Color
                self.B.textColor = UIColor(red: randomColorNumbers[3].0, green: randomColorNumbers[3].1, blue: randomColorNumbers[3].2, alpha: randomColorNumbers[3].3)
                // Start Rotating B
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[3] / 3)
                // Move D
                self.D.center = CGPoint(x: randomNum1[4].0, y: randomNum1[4].1)
                // Change D Color
                self.D.textColor = UIColor(red: randomColorNumbers[4].0, green: randomColorNumbers[4].1, blue: randomColorNumbers[4].2, alpha: randomColorNumbers[4].3)
                // Start Rotating D
                self.D.transform = CGAffineTransform(rotationAngle: randomRotationNumber[4] / 3)
                // Move a2
                self.a2.center = CGPoint(x: randomNum1[5].0, y: randomNum1[5].1)
                // Change a2 Color
                self.a2.textColor = UIColor(red: randomColorNumbers[5].0, green: randomColorNumbers[5].1, blue: randomColorNumbers[5].2, alpha: randomColorNumbers[5].3)
                // Start Rotating a2
                self.a2.transform = CGAffineTransform(rotationAngle: randomRotationNumber[5] / 3)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.50) {
                self.logoIV.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
                // Continue Rotating L
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[0] / 2)
                // Continue Rotating A
                self.A.transform = CGAffineTransform(rotationAngle: randomRotationNumber[1] / 2)
                // Continue Rotating M
                self.M.transform = CGAffineTransform(rotationAngle: randomRotationNumber[2] / 2)
                // Continue Rotating B
                self.B.transform = CGAffineTransform(rotationAngle: randomRotationNumber[3] / 2)
                // Continue Rotating D
                self.D.transform = CGAffineTransform(rotationAngle: randomRotationNumber[4] / 2)
                // Continue Rotating a2
                self.a2.transform = CGAffineTransform(rotationAngle: randomRotationNumber[5] / 2)
                
                
            }
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.5) {
                self.logoIV.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                // Finish Rotating L
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[0])
                // Finish Rotating A
                self.A.transform = CGAffineTransform(rotationAngle: randomRotationNumber[1])
                // Finish Rotating M
                self.M.transform = CGAffineTransform(rotationAngle: randomRotationNumber[2])
                // Finish Rotating B
                self.B.transform = CGAffineTransform(rotationAngle: randomRotationNumber[3])
                // Finish Rotating D
                self.D.transform = CGAffineTransform(rotationAngle: randomRotationNumber[4])
                // Finish Rotating a2
                self.a2.transform = CGAffineTransform(rotationAngle: randomRotationNumber[5])
                
            }
            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0.5) {
                self.logoIV.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }
        }, completion: nil)
        
     
        }
    
    func gatherLetters() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
            
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.50) {
                // Start expanding the logo
                self.logoIV.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                // Move L
                self.L.center = CGPoint(x: randomNum1[0].0, y: randomNum1[0].1)
                // Change L Color
                self.L.textColor = UIColor(red: randomColorNumbers[0].0, green: randomColorNumbers[0].1, blue: randomColorNumbers[0].2, alpha: randomColorNumbers[0].3)
                // Start Rotating L
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[0] / 3)
                // Move A
                self.A.center = CGPoint(x: randomNum1[1].0, y: randomNum1[1].1)
                // Change A Color
                self.A.textColor = UIColor(red: randomColorNumbers[1].0, green: randomColorNumbers[1].1, blue: randomColorNumbers[1].2, alpha: randomColorNumbers[1].3)
                // Start Rotating A
                self.A.transform = CGAffineTransform(rotationAngle: randomRotationNumber[1] / 3)
                // Move M
                self.M.center = CGPoint(x: randomNum1[2].0, y: randomNum1[2].1)
                // Change M colo
                self.M.textColor = UIColor(red: randomColorNumbers[2].0, green: randomColorNumbers[2].1, blue: randomColorNumbers[2].2, alpha: randomColorNumbers[2].3)
                // Start Rotating M
                self.M.transform = CGAffineTransform(rotationAngle: randomRotationNumber[2] / 3)
                // Move B
                self.B.center = CGPoint(x: randomNum1[3].0, y: randomNum1[3].1)
                // Change B Color
                self.B.textColor = UIColor(red: randomColorNumbers[3].0, green: randomColorNumbers[3].1, blue: randomColorNumbers[3].2, alpha: randomColorNumbers[3].3)
                // Start Rotating B
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[3] / 3)
                // Move D
                self.D.center = CGPoint(x: randomNum1[4].0, y: randomNum1[4].1)
                // Change D Color
                self.D.textColor = UIColor(red: randomColorNumbers[4].0, green: randomColorNumbers[4].1, blue: randomColorNumbers[4].2, alpha: randomColorNumbers[4].3)
                // Start Rotating D
                self.D.transform = CGAffineTransform(rotationAngle: randomRotationNumber[4] / 3)
                // Move a2
                self.a2.center = CGPoint(x: randomNum1[5].0, y: randomNum1[5].1)
                // Change a2 Color
                self.a2.textColor = UIColor(red: randomColorNumbers[5].0, green: randomColorNumbers[5].1, blue: randomColorNumbers[5].2, alpha: randomColorNumbers[5].3)
                // Start Rotating a2
                self.a2.transform = CGAffineTransform(rotationAngle: randomRotationNumber[5] / 3)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.50) {
                self.logoIV.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
                // Continue Rotating L
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[0] / 2)
                // Continue Rotating A
                self.A.transform = CGAffineTransform(rotationAngle: randomRotationNumber[1] / 2)
                // Continue Rotating M
                self.M.transform = CGAffineTransform(rotationAngle: randomRotationNumber[2] / 2)
                // Continue Rotating B
                self.B.transform = CGAffineTransform(rotationAngle: randomRotationNumber[3] / 2)
                // Continue Rotating D
                self.D.transform = CGAffineTransform(rotationAngle: randomRotationNumber[4] / 2)
                // Continue Rotating a2
                self.a2.transform = CGAffineTransform(rotationAngle: randomRotationNumber[5] / 2)
                
                
            }
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.5) {
                self.logoIV.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                // Finish Rotating L
                self.L.transform = CGAffineTransform(rotationAngle: randomRotationNumber[0])
                // Finish Rotating A
                self.A.transform = CGAffineTransform(rotationAngle: randomRotationNumber[1])
                // Finish Rotating M
                self.M.transform = CGAffineTransform(rotationAngle: randomRotationNumber[2])
                // Finish Rotating B
                self.B.transform = CGAffineTransform(rotationAngle: randomRotationNumber[3])
                // Finish Rotating D
                self.D.transform = CGAffineTransform(rotationAngle: randomRotationNumber[4])
                // Finish Rotating a2
                self.a2.transform = CGAffineTransform(rotationAngle: randomRotationNumber[5])
                
            }
            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0.5) {
                self.logoIV.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                // Return L to Normal
                self.L.transform = .identity
                // Return A to Normal
                self.A.transform = .identity
                // Return M to Normal
                self.M.transform = .identity
                // Return B to Normal
                self.B.transform = .identity
                // Return D to Normal
                self.D.transform = .identity
                // Return a2 to Normal
                self.a2.transform = .identity
            }
        }, completion: nil)
        
     
        }
        
    
    
    
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


