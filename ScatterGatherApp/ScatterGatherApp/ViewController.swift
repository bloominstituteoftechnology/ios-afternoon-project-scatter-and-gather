//
//  ViewController.swift
//  ScatterGatherApp
//
//  Created by Mark Poggi on 4/14/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    var firstALabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var lastALabel = UILabel()
    var hasRun = Bool()
    
    
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLambdaText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alignLambdaText()
        
        
    }
    
    private func alignLambdaText() {
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        
        firstALabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        firstALabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
        firstALabel.widthAnchor.constraint(equalTo: firstALabel.heightAnchor).isActive = true
        
        mLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: firstALabel.trailingAnchor, constant: 10).isActive = true
        mLabel.widthAnchor.constraint(equalTo: mLabel.heightAnchor).isActive = true
        
        bLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 10).isActive = true
        bLabel.widthAnchor.constraint(equalTo: bLabel.heightAnchor).isActive = true
        
        dLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 10).isActive = true
        dLabel.widthAnchor.constraint(equalTo: dLabel.heightAnchor).isActive = true
        
        lastALabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        lastALabel.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 10).isActive = true
        lastALabel.widthAnchor.constraint(equalTo: lastALabel.heightAnchor).isActive = true
        
    }
    
    private func configureLambdaText() {
    
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.1
        label.backgroundColor = .white
        label.layer.cornerRadius = 12
        label.text = "L"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48)
        
        firstALabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        firstALabel.translatesAutoresizingMaskIntoConstraints = false
        firstALabel.layer.borderWidth = 0.1
        firstALabel.layer.cornerRadius = 12
        firstALabel.text = "A"
        firstALabel.textAlignment = .center
        firstALabel.font = UIFont.systemFont(ofSize: 48)
        
        mLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.layer.borderWidth = 0.1
        mLabel.layer.cornerRadius = 12
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 48)
        
        bLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.layer.borderWidth = 0.1
        bLabel.layer.cornerRadius = 12
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 48)
        
        dLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.layer.borderWidth = 0.1
        dLabel.layer.cornerRadius = 12
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 48)
        
        lastALabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        lastALabel.translatesAutoresizingMaskIntoConstraints = false
        lastALabel.layer.borderWidth = 0.1
        lastALabel.layer.cornerRadius = 12
        lastALabel.text = "A"
        lastALabel.textAlignment = .center
        lastALabel.font = UIFont.systemFont(ofSize: 48)
        
        view.addSubview(label)
        view.addSubview(firstALabel)
        view.addSubview(mLabel)
        view.addSubview(bLabel)
        view.addSubview(dLabel)
        view.addSubview(lastALabel)
        
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        
    }
    
    private func returnToStart() {
        self.label.transform = .identity
        self.firstALabel.transform = .identity
        self.mLabel.transform = .identity
        self.bLabel.transform = .identity
        self.dLabel.transform = .identity
        self.lastALabel.transform = .identity
        self.lambdaLogo.transform = .identity
        
        
    }
    
    private func lambdaLetterAnimation() {
        hasRun = false
        
        
        func scaleRandom() -> CGFloat {
            let randomNumber = Float.random(in: 0.5 ..< 2)
            let randomCGform = CGFloat(randomNumber)
            return randomCGform
        }
        
        func rotateRandom() -> CGFloat {
            let randomNumber = Float.random(in: 8 ..< 16)
            let randomCGform = CGFloat(.pi/randomNumber)
            return randomCGform
        }
        
        func translationRandom() -> CGFloat {
            let randomNumber = Float.random(in: 0 ..< 200)
            let randomCGform = CGFloat(randomNumber)
            return randomCGform
        }
        
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
                self.lambdaLogo.alpha = 1
                self.label.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.firstALabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.bLabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.dLabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.mLabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.lastALabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))


            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
                self.lambdaLogo.alpha = 0.0
                self.label.transform = CGAffineTransform(translationX: translationRandom(), y: translationRandom()+200).concatenating(CGAffineTransform(scaleX: scaleRandom(), y: scaleRandom()))
                self.firstALabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.bLabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.dLabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.mLabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: translationRandom()))
                self.lastALabel.transform = CGAffineTransform(rotationAngle: rotateRandom()).concatenating(CGAffineTransform(translationX: translationRandom(), y: -translationRandom()))

            }
            
        }
        
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animBlock, completion: nil)
    }
    
    
    @IBAction func toggleBarTapped(_ sender: UIButton) {
        print(hasRun)
        if hasRun == false {
            lambdaLetterAnimation()
            hasRun = true
        } else {
            returnToStart()
            hasRun = false
        }
        
    }
}






//       let animBlock = {
//            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.5) {
////                self.label.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber())
//                self.label.backgroundColor = .blue
//
////                self.firstALabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber())
////                self.mLabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber())
////                self.bLabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber())
////                self.dLabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber())
////                self.lastALabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber())
//            }
//
////            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.7) {
////                self.label.transform = CGAffineTransform(rotationAngle: rotateRandomNumber())
////                self.firstALabel.transform = CGAffineTransform(rotationAngle: rotateRandomNumber())
////                self.mLabel.transform = CGAffineTransform(rotationAngle: rotateRandomNumber())
////                self.bLabel.transform = CGAffineTransform(rotationAngle: rotateRandomNumber())
////                self.dLabel.transform = CGAffineTransform(rotationAngle: rotateRandomNumber())
////                self.lastALabel.transform = CGAffineTransform(rotationAngle: rotateRandomNumber())
////            }
//
//            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
////                self.label.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber()+300)
//                self.label.backgroundColor = .red
////                self.label.transform = CGAffineTransform(scaleX: scaleRandomNumber(), y: scaleRandomNumber())
//
////                self.firstALabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber()+250)
////                self.mLabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber()+175)
////                self.bLabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber()+198)
////                self.dLabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber()+120)
////                self.lastALabel.transform = CGAffineTransform(translationX: translationRandomNumber(), y: translationRandomNumber()+500)
//            }
//
//        }
//
//        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animBlock, completion: nil)
//    }
//
