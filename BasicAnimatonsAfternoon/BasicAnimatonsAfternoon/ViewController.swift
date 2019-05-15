//
//  ViewController.swift
//  BasicAnimatonsAfternoon
//
//  Created by Christopher Aronson on 5/15/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Mark: - Properties
    var shouldScramble = true
    
    // MARK: - IBOutlets
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var finalALabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    //MARK: - View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func toggleTapped(_ sender: Any) {
        if shouldScramble {
            fadeLogo()
            scramble()
            changeBackground()
            shouldScramble = !shouldScramble
        } else {
            fadeInLogo()
            reset()
            changeBackgroundBack()
            shouldScramble = !shouldScramble
        }
    }
    
    // MARK: - Background Color Functions
    func changeBackground() {
        UIView.animate(withDuration: 3) {
            self.lLabel.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1).cgColor
        }
        UIView.animate(withDuration: 3) {
            self.aLabel.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1).cgColor
        }
        UIView.animate(withDuration: 3) {
            self.mLabel.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1).cgColor
        }
        UIView.animate(withDuration: 3) {
            self.bLabel.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1).cgColor
        }
        UIView.animate(withDuration: 3) {
            self.dLabel.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1).cgColor
        }
        UIView.animate(withDuration: 3) {
            self.finalALabel.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1).cgColor
        }
    }
    
    func changeBackgroundBack() {
        UIView.animate(withDuration: 3) {
            self.lLabel.layer.backgroundColor = UIColor.clear.cgColor
        }
        UIView.animate(withDuration: 3) {
            self.aLabel.layer.backgroundColor = UIColor.clear.cgColor
        }
        UIView.animate(withDuration: 3) {
            self.mLabel.layer.backgroundColor = UIColor.clear.cgColor
        }
        UIView.animate(withDuration: 3) {
            self.bLabel.layer.backgroundColor = UIColor.clear.cgColor
        }
        UIView.animate(withDuration: 3) {
            self.dLabel.layer.backgroundColor = UIColor.clear.cgColor
        }
        UIView.animate(withDuration: 3) {
            self.finalALabel.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    // MARK: - Translation Functions
    func scramble() {
        UIView.animate(withDuration: 3) {
            self.lLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: -100...300), y: CGFloat.random(in: -100...700)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
            self.lLabel.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1)
        }
        UIView.animate(withDuration: 3) {
            self.aLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: -150...250), y: CGFloat.random(in: -100...700)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
            self.aLabel.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1)
        }
        UIView.animate(withDuration: 3) {
            self.mLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: -200...200), y: CGFloat.random(in: -100...700)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
            self.mLabel.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1)
        }
        UIView.animate(withDuration: 3) {
            self.bLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: -250...150), y: CGFloat.random(in: -100...700)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
            self.bLabel.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1)
        }
        UIView.animate(withDuration: 3) {
            self.dLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: -300...100), y: CGFloat.random(in: -100...700)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
            self.dLabel.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1)
        }
        UIView.animate(withDuration: 3) {
            self.finalALabel.transform = CGAffineTransform(translationX: CGFloat.random(in: -350...50), y: CGFloat.random(in: -100...700)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
            self.finalALabel.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0..<1), brightness: CGFloat.random(in: 0..<1), alpha: 1)
        }
        
    }
    
    func reset() {
        UIView.animate(withDuration: 3) {
            self.lLabel.transform = .identity
            self.lLabel.textColor = .black
        }
        UIView.animate(withDuration: 3) {
            self.aLabel.transform = .identity
            self.aLabel.textColor = .black
        }
        UIView.animate(withDuration: 3) {
            self.mLabel.transform = .identity
            self.mLabel.textColor = .black
        }
        UIView.animate(withDuration: 3) {
            self.bLabel.transform = .identity
            self.bLabel.textColor = .black
        }
        UIView.animate(withDuration: 3) {
            self.dLabel.transform = .identity
            self.dLabel.textColor = .black
        }
        UIView.animate(withDuration: 3) {
            self.finalALabel.transform = .identity
            self.finalALabel.textColor = .black
        }
    }
    
    // MARK: - Logo Fade Functions
    func fadeLogo() {
        UIView.animate(withDuration: 3) {
            self.logoImageView.alpha = 0
        }
    }
    
    func fadeInLogo() {
        UIView.animate(withDuration: 3) {
            self.logoImageView.alpha = 1
        }
    }
}

