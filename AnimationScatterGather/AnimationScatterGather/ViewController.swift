//
//  ViewController.swift
//  AnimationScatterGather
//
//  Created by Brian Rouse on 5/11/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var firstAlphabetLabel: UILabel!
    @IBOutlet weak var secondAlphabetLabelLabel: UILabel!
    @IBOutlet weak var thirdAlphabetLabel: UILabel!
    @IBOutlet weak var fourthAlphabetLabel: UILabel!
    @IBOutlet weak var fifthAlphabetLabel: UILabel!
    @IBOutlet weak var sixthAlphabetLabel: UILabel!
    
    // MARK: - iVars
    
    var isScattered: Bool = false
    
    var lbl1CenterPosition: CGPoint?
    var lbl2CenterPosition: CGPoint?
    var lbl3CenterPosition: CGPoint?
    var lbl4CenterPosition: CGPoint?
    var lbl5CenterPosition: CGPoint?
    var lbl6CenterPosition: CGPoint?
    
    var randomColor: UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.6
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.7
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lbl1CenterPosition = firstAlphabetLabel.center
        lbl2CenterPosition = secondAlphabetLabelLabel.center
        lbl3CenterPosition = thirdAlphabetLabel.center
        lbl4CenterPosition = fourthAlphabetLabel.center
        lbl5CenterPosition = fifthAlphabetLabel.center
        lbl6CenterPosition = sixthAlphabetLabel.center
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        self.isScattered = !self.isScattered
        self.handleLogoImageView()
        
        if self.isScattered {
            setRandomColorToAlphabets()
            
            UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
                self.firstAlphabetLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.secondAlphabetLabelLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.thirdAlphabetLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.fourthAlphabetLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.fifthAlphabetLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.sixthAlphabetLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: nil)
            
            firstAlphabetLabel.move(to: getRandomPositionValue(), duration: 3.0, options: .curveLinear)
            secondAlphabetLabelLabel.move(to: getRandomPositionValue(), duration: 3.0, options: .transitionCrossDissolve)
            thirdAlphabetLabel.move(to: getRandomPositionValue(), duration: 3.0, options: .curveLinear)
            fourthAlphabetLabel.move(to: getRandomPositionValue(), duration: 3.0, options: .transitionCrossDissolve)
            fifthAlphabetLabel.move(to: getRandomPositionValue(), duration: 3.0, options: .curveLinear)
            sixthAlphabetLabel.move(to: getRandomPositionValue(), duration: 3.0, options: .transitionCrossDissolve)
        } else {
            resetLabels()
        }
        
    }
    
    // MARK: - Helper Methods
    
    private func setRandomColorToAlphabets() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.firstAlphabetLabel.textColor = self.randomColor
            self.secondAlphabetLabelLabel.textColor = self.randomColor
            self.thirdAlphabetLabel.textColor = self.randomColor
            self.fourthAlphabetLabel.textColor = self.randomColor
            self.fifthAlphabetLabel.textColor = self.randomColor
            self.sixthAlphabetLabel.textColor = self.randomColor
            
            self.firstAlphabetLabel.backgroundColor = self.randomColor
            self.secondAlphabetLabelLabel.backgroundColor = self.randomColor
            self.thirdAlphabetLabel.backgroundColor = self.randomColor
            self.fourthAlphabetLabel.backgroundColor = self.randomColor
            self.fifthAlphabetLabel.backgroundColor = self.randomColor
            self.sixthAlphabetLabel.backgroundColor = self.randomColor
        }, completion: nil)
    }
    
    private func resetLabels() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            self.firstAlphabetLabel.transform = CGAffineTransform.identity
            self.secondAlphabetLabelLabel.transform = CGAffineTransform.identity
            self.thirdAlphabetLabel.transform = CGAffineTransform.identity
            self.fourthAlphabetLabel.transform = CGAffineTransform.identity
            self.fifthAlphabetLabel.transform = CGAffineTransform.identity
            self.sixthAlphabetLabel.transform = CGAffineTransform.identity
            
            self.firstAlphabetLabel.textColor = .black
            self.secondAlphabetLabelLabel.textColor = .black
            self.thirdAlphabetLabel.textColor = .black
            self.fourthAlphabetLabel.textColor = .black
            self.fifthAlphabetLabel.textColor = .black
            self.sixthAlphabetLabel.textColor = .black
            
            self.firstAlphabetLabel.backgroundColor = .clear
            self.secondAlphabetLabelLabel.backgroundColor = .clear
            self.thirdAlphabetLabel.backgroundColor = .clear
            self.fourthAlphabetLabel.backgroundColor = .clear
            self.fifthAlphabetLabel.backgroundColor = .clear
            self.sixthAlphabetLabel.backgroundColor = .clear
        }, completion: nil)
        
        if let lbl1Postion = lbl1CenterPosition, let lbl2Postion = lbl2CenterPosition, let lbl3Postion = lbl3CenterPosition, let lbl4Postion = lbl4CenterPosition, let lbl5Postion = lbl5CenterPosition, let lbl6Postion = lbl6CenterPosition {
            
            UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: {
                self.firstAlphabetLabel.center = lbl1Postion
                self.secondAlphabetLabelLabel.center = lbl2Postion
                self.thirdAlphabetLabel.center = lbl3Postion
                self.fourthAlphabetLabel.center = lbl4Postion
                self.fifthAlphabetLabel.center = lbl5Postion
                self.sixthAlphabetLabel.center = lbl6Postion
            }, completion: nil)
            
        }
    }
    
    private func getRandomPositionValue() -> CGPoint {
         
        return CGPoint(x: CGFloat(CGFloat.random(in: 10..<self.view.frame.width - 10)), y: CGFloat(CGFloat.random(in: 70..<self.view.frame.height - 10)))
    }
    
    private func handleLogoImageView() {
        
        UIView.animate(withDuration: 2.6, delay: 0, options: .curveEaseOut, animations: {
            if self.isScattered {
                self.logoImageView.alpha = 0.0
            } else {
                self.logoImageView.alpha = 1.0
            }
        }, completion: nil)
    }
}

extension UILabel {
    func move(to destination: CGPoint, duration: TimeInterval,
              options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: nil)
    }
}
