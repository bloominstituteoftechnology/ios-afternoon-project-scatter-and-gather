//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by denis cedeno on 11/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    var isScattered: Bool = false
    var lOriginPoint: CGPoint!
    var aOriginPoint: CGPoint!
    var mOriginPoint: CGPoint!
    var bOriginPoint: CGPoint!
    var dOriginPoint: CGPoint!
    var aaOriginPoint: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originLocations()
    }
    
    private func originLocations() {
        if !isScattered{
            lOriginPoint = lLabel.center
            aOriginPoint = aLabel.center
            mOriginPoint = mLabel.center
            bOriginPoint = bLabel.center
            dOriginPoint = dLabel.center
            aaOriginPoint = secondALabel.center
        }
    }
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == true {
            gather()
        } else {
            scatter()
        }
        isScattered.toggle()
    }
    
    func gather() {
        UIView.animate(withDuration: 3.0) {
            self.lambdaLogoImageView.alpha = 1.0
            self.lLabel.transform = .identity
            self.lLabel.textColor = .black
            self.lLabel.backgroundColor = .white
            self.lLabel.alpha = 1.0
            self.lLabel.alpha = 1.0
            self.lLabel.center = self.lOriginPoint
            
            self.aLabel.transform = .identity
            self.aLabel.textColor = .black
            self.aLabel.backgroundColor = .white
            self.aLabel.alpha = 1.0
            self.aLabel.alpha = 1.0
            self.aLabel.center = self.aOriginPoint
            
            self.mLabel.transform = .identity
            self.mLabel.textColor = .black
            self.mLabel.backgroundColor = .white
            self.mLabel.alpha = 1.0
            self.mLabel.alpha = 1.0
            self.mLabel.center = self.mOriginPoint
            
            self.bLabel.transform = .identity
            self.bLabel.textColor = .black
            self.bLabel.backgroundColor = .white
            self.bLabel.alpha = 1.0
            self.bLabel.alpha = 1.0
            self.bLabel.center = self.bOriginPoint
            
            self.dLabel.transform = .identity
            self.dLabel.textColor = .black
            self.dLabel.backgroundColor = .white
            self.dLabel.alpha = 1.0
            self.dLabel.alpha = 1.0
            self.dLabel.center = self.dOriginPoint
            
            self.secondALabel.transform = .identity
            self.secondALabel.textColor = .black
            self.secondALabel.backgroundColor = .white
            self.secondALabel.alpha = 1.0
            self.secondALabel.alpha = 1.0
            self.secondALabel.center = self.aaOriginPoint
            
        }
    }
    
    func randomPoint(letter: UILabel) -> CGPoint {
        let randomX = Int.random(in: 0...Int(view.bounds.size.width - letter.frame.size.width))
        let randomY = Int.random(in: 0...Int(view.bounds.size.height - letter.frame.size.height ))
        
        letter.center = CGPoint(x: randomX, y: randomY)
        return letter.center
    }
    
    func randomBackgroundColor() -> CGColor{
        let backgroundColor = CGColor(srgbRed: CGFloat(Int.random(in: 0...100))/100, green: CGFloat(Int.random(in: 0...100))/100, blue: CGFloat(Int.random(in: 0...100))/100, alpha: 1)
        return backgroundColor
    }
    
    func randomTextColor(letter: UILabel) {
        let textColor = UIColor(displayP3Red: CGFloat(Int.random(in: 0...100))/100, green: CGFloat(Int.random(in: 0...100))/100, blue: CGFloat(Int.random(in: 0...100))/100, alpha: 1)
        letter.textColor = textColor
    }
    
    func scatter() {
        UIView.animate(withDuration: 3.0) {
            self.lambdaLogoImageView.alpha = 0.0
            
            
            let animationBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                    self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
                    self.lLabel.center = self.randomPoint(letter: self.lLabel)
                    self.randomTextColor(letter: self.lLabel)
                    self.lLabel.layer.backgroundColor = self.randomBackgroundColor()
                    self.lLabel.alpha = 0.2
                }
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3) {
                    self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
                    self.aLabel.center = self.randomPoint(letter: self.aLabel)
                    self.randomTextColor(letter: self.aLabel)
                    self.aLabel.layer.backgroundColor = self.randomBackgroundColor()
                    self.aLabel.alpha = 0.5
                }
       
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                    self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
                    self.mLabel.center = self.randomPoint(letter: self.mLabel)
                    self.randomTextColor(letter: self.mLabel)
                    self.mLabel.layer.backgroundColor = self.randomBackgroundColor()
                    self.mLabel.alpha = 0.5
                }
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                    self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
                    self.bLabel.center = self.randomPoint(letter: self.bLabel)
                    self.randomTextColor(letter: self.bLabel)
                    self.bLabel.layer.backgroundColor = self.randomBackgroundColor()
                    self.bLabel.alpha = 0.5
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                    self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
                    self.dLabel.center = self.randomPoint(letter: self.dLabel)
                    self.randomTextColor(letter: self.dLabel)
                    self.dLabel.layer.backgroundColor = self.randomBackgroundColor()
                    self.dLabel.alpha = 0.5
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.6) {
                    self.secondALabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
                    self.secondALabel.center = self.randomPoint(letter: self.secondALabel)
                    self.randomTextColor(letter: self.secondALabel)
                    self.secondALabel.layer.backgroundColor = self.randomBackgroundColor()
                    self.secondALabel.alpha = 0.5
                }
                
            }
            
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.5, options: [], animations: animationBlock, completion: nil)
            
        }
    }
    
    
    
    //    func configureLabels() {
    //        lLabel = UILabel()
    //        lLabel.translatesAutoresizingMaskIntoConstraints = false
    //        lLabel.text = "L"
    //        lLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    //        view.addSubview(lLabel)
    //
    //        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    //        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90).isActive = true
    //
    //        aLabel = UILabel()
    //        aLabel.translatesAutoresizingMaskIntoConstraints = false
    //        aLabel.text = "a"
    //        aLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    //        view.addSubview(aLabel)
    //
    //        aLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    //        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 8).isActive = true
    //        self.aOriginPoint = aLabel.center
    //
    //        mLabel = UILabel()
    //        mLabel.translatesAutoresizingMaskIntoConstraints = false
    //        mLabel.text = "m"
    //        mLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    //        view.addSubview(mLabel)
    //
    //        mLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    //        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 8).isActive = true
    //
    //        bLabel = UILabel()
    //        bLabel.translatesAutoresizingMaskIntoConstraints = false
    //        bLabel.text = "b"
    //        bLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    //        view.addSubview(bLabel)
    //
    //        bLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    //        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 8).isActive = true
    //
    //        dLabel = UILabel()
    //        dLabel.translatesAutoresizingMaskIntoConstraints = false
    //        dLabel.text = "d"
    //        dLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    //        view.addSubview(dLabel)
    //
    //        dLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    //        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 8).isActive = true
    //
    //        secondALabel = UILabel()
    //        secondALabel.translatesAutoresizingMaskIntoConstraints = false
    //        secondALabel.text = "a"
    //        secondALabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    //        view.addSubview(secondALabel)
    //
    //        secondALabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    //        secondALabel.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 8).isActive = true
    //
    //    }
    
}

