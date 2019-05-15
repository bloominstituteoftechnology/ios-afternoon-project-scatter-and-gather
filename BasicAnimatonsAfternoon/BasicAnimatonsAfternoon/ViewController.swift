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
            shouldScramble = !shouldScramble
        } else {
            fadeInLogo()
            reset()
            shouldScramble = !shouldScramble
        }
    }
    
    func scramble() {
        UIView.animate(withDuration: 3) {
            self.lLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: 0..<self.view.frame.width), y: CGFloat.random(in: 0..<self.view.frame.height)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
        }
        UIView.animate(withDuration: 3) {
            self.aLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: 0..<self.view.frame.width), y: CGFloat.random(in: 0..<self.view.frame.height)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
        }
        UIView.animate(withDuration: 3) {
            self.mLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: 0..<self.view.frame.width), y: CGFloat.random(in: 0..<self.view.frame.height)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
        }
        UIView.animate(withDuration: 3) {
            self.bLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: 0..<self.view.frame.width), y: CGFloat.random(in: 0..<self.view.frame.height)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
        }
        UIView.animate(withDuration: 3) {
            self.dLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: 0..<self.view.frame.width), y: CGFloat.random(in: 0..<self.view.frame.height)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
        }
        UIView.animate(withDuration: 3) {
            self.finalALabel.transform = CGAffineTransform(translationX: CGFloat.random(in: 0..<self.view.frame.width), y: CGFloat.random(in: 0..<self.view.frame.height)).rotated(by: CGFloat.pi / CGFloat.random(in: 0...16))
        }
        
    }
    
    func reset() {
        UIView.animate(withDuration: 3) {
            self.lLabel.transform = .identity
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

