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
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.aLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.mLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.bLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.dLabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.aALabel.transform = CGAffineTransform(translationX: CGFloat(self.randomXGenerator()), y: CGFloat(self.randomYGenerator()))
        }, completion: nil)
            
            isScattered = true
            
        } else {
            UIView.animate(withDuration: 1) {
                self.lLabel.transform = .identity
                self.aLabel.transform = .identity
                self.mLabel.transform = .identity
                self.bLabel.transform = .identity
                self.dLabel.transform = .identity
                self.aALabel.transform = .identity
                self.lambdaLogo.alpha = 1.0
            }
            isScattered = false
        }
}
}
