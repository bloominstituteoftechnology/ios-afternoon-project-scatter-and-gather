//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Vici Shaweddy on 9/21/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var origins: [UILabel: CGPoint] = [:]
    private var isScattered: Bool = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let labels = [self.lLabel, self.aLabel, self.mLabel, self.bLabel, self.dLabel, self.a2Label]
        
        for label in labels {
            guard let label = label else { return }
            let center = label.center
            origins[label] = center
        }
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        let goForward = self.isScattered ? false : true
        UIView.animate(withDuration: 2) {
            self.fadeLogo(forward: goForward)
            self.movedAll(forward: goForward)
            self.changeBgColor(forward: goForward)
            self.rotateLetter(forward: goForward)
        }
        self.isScattered.toggle()
    }
    
    // Private Functions
    
    // fade in and out the logo
    private func fadeLogo(forward: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.logoImageView.alpha = forward ? 0.0 : 1.0
        }
    }
    
    // to move all letters at once
    private func movedAll(forward: Bool) {
        let labels = [self.lLabel, self.aLabel, self.mLabel, self.bLabel, self.dLabel, self.a2Label]
        
        for label in labels {
            guard let label = label else { return }
            label.center = forward ? movedLetter() : origins[label] ?? .zero
        }
    }
    
    // random colors
    private func randomColor() -> UIColor {
        let red: CGFloat = CGFloat.random(in: 0...1)
        let green: CGFloat = CGFloat.random(in: 0...1)
        let blue: CGFloat = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // set the background colors for all letters
    private func changeBgColor(forward: Bool) {
        let labels = [self.lLabel, self.aLabel, self.mLabel, self.bLabel, self.dLabel, self.a2Label]
        for label in labels {
            guard let label = label else { return }
            label.backgroundColor = forward ? randomColor() : UIColor.clear
            label.textColor = forward ? randomColor() : UIColor.black
        }
    }
    
    // rotate the views
    private func rotateLetter(forward: Bool) {
        
        let labels = [self.lLabel, self.aLabel, self.mLabel, self.bLabel, self.dLabel, self.a2Label]
        for label in labels {
            guard let label = label else { return }
            label.transform = forward ? CGAffineTransform(rotationAngle: CGFloat.random(in: -CGFloat.pi...CGFloat.pi)) : .identity
        }
    }
    
    // random point
    private func randomPoint(from vc: ViewController) -> CGPoint {
        // x coordinate between minX (left) and maxX (right)
        let randomX = CGFloat.random(in: vc.view.frame.minX...vc.view.frame.maxX)
        
        // x coordinate between minY (top) and maxY (bottom)
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let minY = vc.view.frame.minY + (vc.navigationController?.navigationBar.frame.height ?? 0) + statusBarHeight
        let randomY = CGFloat.random(in: minY...vc.view.frame.maxY)
        let randomPoint = CGPoint(x: randomX, y: randomY)
        return randomPoint
    }
    
    // to move a letter
    private func movedLetter() -> CGPoint {
        let point = randomPoint(from: self)
        let convertedPoint = self.view.convert(point, to: stackView)
        return convertedPoint
    }
}

