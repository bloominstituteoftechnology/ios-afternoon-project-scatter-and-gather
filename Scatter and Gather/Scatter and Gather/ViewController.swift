//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Hayden Hastings on 5/22/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels()
        print(lLabel.center)
        print(aLabel.center)
        print(mLabel.center)
        print(bLabel.center)
        print(dLabel.center)
        print(lastALabel.center)
    }
    
    // MARK: - Methods
    
    func fadeOutImage() {
        lambdaImageView.alpha = 1
        
        UIView.animate(withDuration: 2) {
            self.lambdaImageView.alpha = 0
        }
    }
    
    func fadeInImage() {
        lambdaImageView.alpha = 0
        
        UIView.animate(withDuration: 2) {
            self.lambdaImageView.alpha = 1
        }
    }
    
    func randomLetters(label: UILabel) {
        
        let minX = Int(self.view.bounds.minX)
        let maxX = Int(self.view.bounds.maxX - 50)
        
        let minY = Int(self.view.bounds.minY)
        let maxY = Int(self.view.bounds.maxY - 150)
        
        let randomX = Int.random(in: minX...maxX)
        let randomY = Int.random(in: minY...maxY)
        
        let randomPoint = CGPoint(x: randomX, y: randomY)
        
        UIView.animate(withDuration: 2.5) {
            
            label.center = randomPoint
            label.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: -180...180)).toRadians())
            
            label.textColor = self.generateRandomColor()
            label.backgroundColor = self.generateRandomColor()
        }
    }
    
    func generateRandomColor() -> UIColor{
        var random: UIColor{
            let r: CGFloat = .random(in: 0...1)
            let g: CGFloat = .random(in: 0...1)
            let b: CGFloat = .random(in: 0...1)
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        return random
    }
    
    func gatherLetters(label: UILabel, originalCenter: (x: Double, y: Double)) {
        let center = CGPoint(x: originalCenter.x, y: originalCenter.y)
        
        UIView.animate(withDuration: 1.5) {
            label.center = center
            label.transform = CGAffineTransform(rotationAngle: 0)
            label.textColor = .black
            label.backgroundColor = .white
        }
        
    }
    
    func labels() {
        lLabel.text = "L"
        aLabel.text = "A"
        mLabel.text = "M"
        bLabel.text = "B"
        dLabel.text = "D"
        lastALabel.text = "A"
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        
        if isScattered {

            randomLetters(label: lLabel)
            randomLetters(label: aLabel)
            randomLetters(label: mLabel)
            randomLetters(label: bLabel)
            randomLetters(label: dLabel)
            randomLetters(label: lastALabel)
            
            fadeOutImage()
            
        } else {
            
            gatherLetters(label: lLabel, originalCenter: originalLCenter)
            gatherLetters(label: aLabel, originalCenter: originalACenter)
            gatherLetters(label: mLabel, originalCenter: originalMCenter)
            gatherLetters(label: bLabel, originalCenter: originalBCenter)
            gatherLetters(label: dLabel, originalCenter: originalDCenter)
            gatherLetters(label: lastALabel, originalCenter: originalLastACenter)
            
            fadeInImage()

        }
       isScattered = !isScattered
    }
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    
    @IBOutlet weak var lambdaImageView: UIImageView!
    
    let originalLCenter = (28.5, 10.25)
    let originalACenter = (93.5, 10.25)
    let originalMCenter = (158.5, 10.25)
    let originalBCenter = (223.5, 10.25)
    let originalDCenter = (288.5, 10.25)
    let originalLastACenter = (353.5, 10.25)
    
    var isScattered: Bool = true
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
