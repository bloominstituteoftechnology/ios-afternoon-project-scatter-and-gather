//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Matthew Martindale on 4/8/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    let animationDuration: Double = 2
    
    var lLabel: UILabel!
    var aLabel: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!

    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    func configureLabels() {
        lLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        aLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        dLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        a2Label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lLabel)
        view.addSubview(aLabel)
        view.addSubview(mLabel)
        view.addSubview(bLabel)
        view.addSubview(dLabel)
        view.addSubview(a2Label)
        
        lLabel.text = "L"
        aLabel.text = "a"
        mLabel.text = "m"
        bLabel.text = "b"
        dLabel.text = "d"
        a2Label.text = "a"
        
        lLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        aLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        mLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        bLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        dLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        a2Label.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 15).isActive = true
        aLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 15).isActive = true
        mLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 15).isActive = true
        bLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 15).isActive = true
        dLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 15).isActive = true
        a2Label.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    }

    func randomRotation() -> [Int] {
        var randomRotationArray: [Int] = []
        for _ in 1...6 {
            randomRotationArray.append(Int.random(in: 1...36))
        }
        return randomRotationArray
    }

    
    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        
        isScattered.toggle()
        
        if isScattered == true {
            UIView.animate(withDuration: animationDuration) {
                self.lambdaLogoImageView.alpha = 0
            }
            
            UIView.animate(withDuration: animationDuration) {
                //L Label
                let translateL = CGAffineTransform(
                    translationX: CGFloat.random(in: 0...self.view.frame.size.width - 100),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                let rotateL = CGAffineTransform(rotationAngle: CGFloat(self.randomRotation()[0]))
                self.lLabel.transform = rotateL.concatenating(translateL)
                self.lLabel.layer.backgroundColor = UIColor.randomColor().cgColor
                self.lLabel.textColor = .randomColor()
                
                //A Label
                let translateA = CGAffineTransform(
                    translationX: CGFloat.random(in: -50...self.view.frame.size.width - 150),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                let rotateA = CGAffineTransform(rotationAngle: CGFloat(self.randomRotation()[1]))
                self.aLabel.transform = rotateA.concatenating(translateA)
                self.aLabel.layer.backgroundColor = UIColor.randomColor().cgColor
                self.aLabel.textColor = .randomColor()
                
                //M Label
                let translateM = CGAffineTransform(
                    translationX: CGFloat.random(in: -75...self.view.frame.size.width - 175),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                let rotateM = CGAffineTransform(rotationAngle: CGFloat(self.randomRotation()[2]))
                self.mLabel.transform = rotateM.concatenating(translateM)
                self.mLabel.layer.backgroundColor = UIColor.randomColor().cgColor
                self.mLabel.textColor = .randomColor()
                
                //B Label
                let translateB = CGAffineTransform(
                    translationX: CGFloat.random(in: -125...self.view.frame.size.width - 200),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                let rotateB = CGAffineTransform(rotationAngle: CGFloat(self.randomRotation()[3]))
                self.bLabel.transform = rotateB.concatenating(translateB)
                self.bLabel.layer.backgroundColor = UIColor.randomColor().cgColor
                self.bLabel.textColor = .randomColor()
                
                //D Label
                let translateD = CGAffineTransform(
                    translationX: CGFloat.random(in: -150...self.view.frame.size.width - 250),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                let rotateD = CGAffineTransform(rotationAngle: CGFloat(self.randomRotation()[4]))
                self.dLabel.transform = rotateD.concatenating(translateD)
                self.dLabel.layer.backgroundColor = UIColor.randomColor().cgColor
                self.dLabel.textColor = .randomColor()
                
                //a2 Label
                let translatea2 = CGAffineTransform(
                    translationX: CGFloat.random(in: -175...self.view.frame.size.width - 300),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                let rotatea2 = CGAffineTransform(rotationAngle: CGFloat(self.randomRotation()[5]))
                self.a2Label.transform = rotatea2.concatenating(translatea2)
                self.a2Label.layer.backgroundColor = UIColor.randomColor().cgColor
                self.a2Label.textColor = .randomColor()
            }
            
        }
        else {
            UIView.animate(withDuration: animationDuration) {
                self.lambdaLogoImageView.alpha = 1
            }
            
            UIView.animate(withDuration: animationDuration) {
                //L Label
                self.lLabel.transform = .identity
                self.lLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.lLabel.textColor = .black
                
                //A Label
                self.aLabel.transform = .identity
                self.aLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.aLabel.textColor = .black
                
                //M Label
                self.mLabel.transform = .identity
                self.mLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.mLabel.textColor = .black
                
                //B Label
                self.bLabel.transform = .identity
                self.bLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.bLabel.textColor = .black
                
                //D Label
                self.dLabel.transform = .identity
                self.dLabel.layer.backgroundColor = UIColor.clear.cgColor
                self.dLabel.textColor = .black
                
                //a2 Label
                self.a2Label.transform = .identity
                self.a2Label.layer.backgroundColor = UIColor.clear.cgColor
                self.a2Label.textColor = .black
            }
            
        }
    }
}



