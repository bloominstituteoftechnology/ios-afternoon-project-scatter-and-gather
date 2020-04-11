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
    let toImage = UIImage(named: "lambda_logo.png")
    
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    @IBOutlet var mLabel: UILabel!
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var aALabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func randomXGenerator() -> Int{
        let width = Int(self.view.bounds.width) - 200
        print(width)
        let randomInt = Int.random(in: 1...width)
        return randomInt
    }
    
    func randomYGenerator() -> Int{
        let height = Int(self.view.bounds.height) - 200
        print(height)
        let randomInt = Int.random(in: 1...height)
        return randomInt
    }
    
    func randomBackgroundColors() ->  UIColor{
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
                self.lLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
                self.lLabel.backgroundColor = self.randomBackgroundColors()
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.aLabel.backgroundColor = self.randomBackgroundColors()
                self.aLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.mLabel.backgroundColor = self.randomBackgroundColors()
                self.mLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.bLabel.backgroundColor = self.randomBackgroundColors()
                self.bLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.dLabel.backgroundColor = self.randomBackgroundColors()
                self.dLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.aALabel.backgroundColor = self.randomBackgroundColors()
                self.aALabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
            }, completion: nil)
            
            isScattered = true
            
        } else {
            UIView.animate(withDuration: 1) {
                self.lLabel.transform = .identity
                self.lLabel.backgroundColor = .clear
                self.aLabel.transform = .identity
                self.aLabel.backgroundColor = .clear
                self.mLabel.transform = .identity
                self.mLabel.backgroundColor = .clear
                self.bLabel.transform = .identity
                self.bLabel.backgroundColor = .clear
                self.dLabel.transform = .identity
                self.dLabel.backgroundColor = .clear
                self.aALabel.transform = .identity
                self.aALabel.backgroundColor = .clear
                self.lambdaLogo.alpha = 1.0
            }
            isScattered = false
        }
    }
}
