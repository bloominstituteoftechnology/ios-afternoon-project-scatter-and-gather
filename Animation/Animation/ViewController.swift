//
//  ViewController.swift
//  Animation
//
//  Created by Claudia Contreras on 4/10/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    var isScattered: Bool = false
    
    //MARK: - IBOutlets
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    @IBOutlet var mLabel: UILabel!
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var a2Label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBAction
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            gatherAnimation()
        } else {
            scatterAnimation()
        }
        
        isScattered.toggle()
    }
    
    //MARK: - Animation Functions
    private func scatterAnimation() {
        fadeLogo()
        moveLettersRandomly()
    }
    
    private func gatherAnimation() {
        unfadeLogo()
        moveLettersBack()
    }
    
    private func fadeLogo() {
        imageView.center = view.center
        
        UIView.animate(withDuration: 3.0) {
            self.imageView.alpha = 0.0
        }
    }
    
    private func unfadeLogo() {
        UIView.animate(withDuration: 3.0) {
            self.imageView.alpha = 1.0
        }
    }
    
    private func moveLettersRandomly() {
        UIView.animate(withDuration: 3.0) {
            var newLocation = self.getRandomLocation(oldX: self.lLabel.frame.origin.x, oldY: self.lLabel.frame.origin.y)
            self.lLabel.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1])
            newLocation = self.getRandomLocation(oldX: self.aLabel.frame.origin.x, oldY: self.aLabel.frame.origin.y)
            self.aLabel.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1])
            newLocation = self.getRandomLocation(oldX: self.mLabel.frame.origin.x, oldY: self.mLabel.frame.origin.y)
            self.mLabel.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1])
            newLocation = self.getRandomLocation(oldX: self.bLabel.frame.origin.x, oldY: self.bLabel.frame.origin.y)
            self.bLabel.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1])
            newLocation = self.getRandomLocation(oldX: self.dLabel.frame.origin.x, oldY: self.dLabel.frame.origin.y)
            self.dLabel.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1])
            newLocation = self.getRandomLocation(oldX: self.a2Label.frame.origin.x, oldY: self.a2Label.frame.origin.y)
            self.a2Label.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1])
        }
    }
    
    private func moveLettersBack() {
        UIView.animate(withDuration: 3.0) {
            self.lLabel.transform = .identity
            self.aLabel.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.a2Label.transform = .identity
        }
    }
    
    private func getRandomLocation(oldX: CGFloat, oldY: CGFloat) -> [CGFloat] {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let newX = CGFloat.random(in: -oldX...(width - oldX))
        let newY = CGFloat.random(in: -oldY...(height - oldY))
        
        print(newX)
        print(newY)
        return [newX, newY]
    }
}

