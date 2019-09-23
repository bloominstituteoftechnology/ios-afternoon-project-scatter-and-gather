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
    
    
    private var isScattered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoImageView.alpha = 1.0
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        fadeLogo()
        movedLetter()
    }
    
    // Private Functions
    
    // fade in and out the logo
    private func fadeLogo() {
        if self.logoImageView.alpha == 1.0 {
            UIView.animate(withDuration: 0.5) {
                self.logoImageView.alpha = 0.0
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.logoImageView.alpha = 1.0
            }
        }
    }
    
    // random point
    private func randomPoint(from vc: ViewController) -> CGPoint {
        // x coordinate between minX (left) and maxX (right)
        let randomX = CGFloat.random(in: vc.view.frame.minX...vc.view.frame.maxX)
        // x coordinate between minY (top) and maxY (bottom)
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let minY = vc.view.frame.minY + (vc.navigationController?.navigationBar.frame.height ?? 0) + statusBarHeight
        print(minY)
        let randomY = CGFloat.random(in: minY...vc.view.frame.maxY)
        print(vc.view.frame.maxY)
        let randomPoint = CGPoint(x: randomX, y: randomY)
        print(randomPoint)6
        return randomPoint
    }
    
    private func movedLetter() {
        let point = randomPoint(from: self)
        let convertedPoint = self.view.convert(point, to: stackView)
        self.lLabel.center = convertedPoint
        self.aLabel.center = convertedPoint
        self.mLabel.center = convertedPoint
        self.bLabel.center = convertedPoint
        self.dLabel.center = convertedPoint
        self.a2Label.center = convertedPoint
        
    }
    

    
    
}

