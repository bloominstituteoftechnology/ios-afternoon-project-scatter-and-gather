//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Jarren Campos on 4/10/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isScattered = false
    
    
    @IBOutlet var lambdaLogo: UIImageView!
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    @IBOutlet var mLabel: UILabel!
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var aALabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func randomXGenerator() -> Int{
        let width = Int(self.view.bounds.width) - 200
        let randomInt = Int.random(in: 1...width)
        return randomInt
    }
    
    func randomYGenerator() -> Int{
        let height = Int(self.view.bounds.height) - 200
        let randomInt = Int.random(in: 1...height)
        return randomInt
    }
    
    func randomPercentage() -> CGFloat {
        let randomFloat = CGFloat.random(in: -3.6...3.6)
        return randomFloat
    }
    
    func randomColors() ->  UIColor{
        let colorArray: [UIColor] = [.blue, .red, .green, .cyan, .gray, .orange]
        let randomInt = Int.random(in: 0...(colorArray.count - 1))
        let pickedColor: UIColor = colorArray[randomInt]
        return pickedColor
    }
    @IBAction func toggleButtonPressed_(_ sender: Any) {
        startAnimation()
    }
    
    func startAnimation() {
        if isScattered == false {
            
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
                self.lambdaLogo.alpha = 0.0
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.lLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator())).rotated(by: self.randomPercentage())
                self.lLabel.backgroundColor = self.randomColors()
                self.lLabel.textColor = self.randomColors()
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.aLabel.backgroundColor = self.randomColors()
                self.aLabel.textColor = self.randomColors()
                
                self.aLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator())).rotated(by: self.randomPercentage())
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.mLabel.backgroundColor = self.randomColors()
                self.mLabel.textColor = self.randomColors()
                
                self.mLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator())).rotated(by: self.randomPercentage())
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.bLabel.backgroundColor = self.randomColors()
                self.bLabel.textColor = self.randomColors()
                
                self.bLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator())).rotated(by: self.randomPercentage())
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.dLabel.backgroundColor = self.randomColors()
                self.dLabel.textColor = self.randomColors()
                
                self.dLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator())).rotated(by: self.randomPercentage())
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.aALabel.backgroundColor = self.randomColors()
                self.aALabel.textColor = self.randomColors()
                
                self.aALabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator())).rotated(by: self.randomPercentage())
            }, completion: nil)
            
            isScattered = true
            
        } else {
            UIView.animate(withDuration: 1) {
                self.lLabel.transform = .identity
                self.lLabel.backgroundColor = .clear
                self.lLabel.textColor = .black
                self.aLabel.transform = .identity
                self.aLabel.backgroundColor = .clear
                self.aLabel.textColor = .black
                self.mLabel.transform = .identity
                self.mLabel.backgroundColor = .clear
                self.mLabel.textColor = .black
                self.bLabel.transform = .identity
                self.bLabel.backgroundColor = .clear
                self.bLabel.textColor = .black
                self.dLabel.transform = .identity
                self.dLabel.backgroundColor = .clear
                self.dLabel.textColor = .black
                self.aALabel.transform = .identity
                self.aALabel.backgroundColor = .clear
                self.aALabel.textColor = .black
                self.lambdaLogo.alpha = 1.0
            }
            isScattered = false
        }
    }
}
