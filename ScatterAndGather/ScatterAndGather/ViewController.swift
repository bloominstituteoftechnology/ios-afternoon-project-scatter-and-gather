//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by David Williams on 4/12/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isToggled: Bool = false
    var labelL: UILabel!
    var labelA1: UILabel!
    var labelM: UILabel!
    var labelB: UILabel!
    var labelD: UILabel!
    var labelA2: UILabel!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObjects()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.cyan.cgColor, UIColor.red.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
    }

    private func configureObjects() {
        labelL = UILabel(frame: CGRect(x: 10, y: 155, width: 50, height: 50))
        labelL.text = "L"
        
        labelA1 = UILabel(frame: CGRect(x: 55, y: 155, width: 50, height: 50))
        labelA1.text = "a"
        
        labelM = UILabel(frame: CGRect(x: 100, y: 155, width: 50, height: 50))
        labelM.text = "m"
        
        labelB = UILabel(frame: CGRect(x: 145, y: 155, width: 50, height: 50))
        labelB.text = "b"
        
        labelD = UILabel(frame: CGRect(x: 190, y: 155, width: 50, height: 50))
        labelD.text = "d"
        
        labelA2 = UILabel(frame: CGRect(x: 235, y: 155, width: 50, height: 50))
        labelA2.text = "a"
        
        for label in [labelL, labelA1, labelM, labelB, labelD, labelA2] {
            label?.textAlignment = .center
            label?.textColor = .black
            label?.font = UIFont.systemFont(ofSize: 86)
            label?.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label!)
        }
        
        
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackview)
        
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        
        stackview.addArrangedSubview(labelL)
        stackview.addArrangedSubview(labelA1)
        stackview.addArrangedSubview(labelM)
        stackview.addArrangedSubview(labelB)
        stackview.addArrangedSubview(labelD)
        stackview.addArrangedSubview(labelA2)
        
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.image = UIImage(named: "lambda_logo")
        self.imageView = imageView
        
        imageView.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 55).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -55).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        
    }

    @IBAction func toggleButtpnPressed(_ sender: Any) {
        isToggled.toggle()
        if isToggled {
            UIViewPropertyAnimator(duration: 2.5, curve: .easeOut, animations: {
                self.imageView.alpha = 0.0
            }).startAnimation()
            animateOut()
        } else {
            UIViewPropertyAnimator(duration: 2.5, curve: .easeOut, animations: {
                self.imageView.alpha = 1.0
            }).startAnimation()
            animateBack()
        }
    }
    
     let randomAngle1 = Int.random(in: 1...100)
    let randomAngle2 = Int.random(in: 0...50)
    let random3 = Int.random(in: 0...60)
    let random4 = Int.random(in: 0...500)
    
    private func animateOut() {
        let rAngle1 = randomAngle1
        let rAngle2 = randomAngle2
        let rRan3 = random3
        let rRan4 = random4
        
        labelL.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
        }, completion: nil)
        
        let animLabelLBlock = {
           
            self.labelL.layer.backgroundColor = UIColor.randomColor().cgColor
            self.labelL.textColor = .randomColor()
            
           // let randomAngle1 = Int.random(in: 1...100)
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle1))
            }
            
           // let randomAngle2 = Int.random(in: 0...50)
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle2))
            }
            
           // let random3 = Int.random(in: 0...60)
           // let random4 = Int.random(in: 0...500)
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.70) {
                self.labelL.center = CGPoint(
                    x: CGFloat(rRan3) + self.labelL.bounds.size.width + CGFloat(rAngle2),
                    y: self.view.center.y + CGFloat(rRan4)
                )
            }
           
        }
        
        
        labelA1.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
        }, completion: nil)
        
        let animLabelA1Block = {
            
            self.labelA1.layer.backgroundColor = UIColor.randomColor().cgColor
            self.labelA1.textColor = .randomColor()
            
           // let randomAngle1 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.labelA1.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle1))
            }
            
            //let randomAngle2 = Int.random(in: 0...50)
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.labelA1.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.70) {
                self.labelA1.center = CGPoint(
                    x: CGFloat(rAngle2) + self.labelA1.bounds.size.height,
                    y: CGFloat(rAngle1)
                )
            }
        }
        
        labelM.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
        }, completion: nil)
        
        let animLabelMBlock = {
            
            self.labelM.layer.backgroundColor = UIColor.randomColor().cgColor
            self.labelM.textColor = .randomColor()
            
           // let randomAngle1 = Int.random(in: 0...90)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle1))
            }
            
           // let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle2))
            }
            
//            let random3 = Int.random(in: 0...60)
//            let random4 = Int.random(in: 0...500)
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.60) {
                self.labelM.center = CGPoint(
                    x: CGFloat(rRan3) + self.labelL.bounds.size.width + CGFloat(rRan3),
                    y: self.view.center.y + CGFloat(rRan4)
                )
            }
        }
        
        labelB.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
        }, completion: nil)
        
        let animLabelBBlock = {
            let y = self.view.bounds.size.width
            self.labelB.layer.backgroundColor = UIColor.randomColor().cgColor
            self.labelB.textColor = .randomColor()
            
          //  let randomAngle1 = Int.random(in: 10...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle1))
            }
            
          //  let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.60) {
                self.labelM.center = CGPoint(
                    x: CGFloat(CGFloat(rAngle1)),
                    y: y / self.labelB.bounds.size.height/2
                )
            }
        }
        
        labelD.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
        }, completion: nil)
        
        let animLabelDBlock = {
            
            self.labelD.layer.backgroundColor = UIColor.randomColor().cgColor
            self.labelD.textColor = .randomColor()
            
           // let randomAngle1 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle1))
            }
            
            //let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.60) {
                self.labelD.center = CGPoint(
                    x: self.view.bounds.size.width - CGFloat(rAngle2),
                    y: self.view.bounds.size.width / CGFloat(rAngle2)
                )
            }
        }
        labelA2.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
        }, completion: nil)
        
        let animLabelA2Block = {
            
            self.labelA2.layer.backgroundColor = UIColor.randomColor().cgColor
            self.labelA2.textColor = .randomColor()
            
            //let randomAngle1 = Int.random(in: 10...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle1))
            }
            
           // let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat(rAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.60) {
                self.labelA2.center = CGPoint(
                    x: CGFloat(CGFloat(rAngle2)),
                    y: CGFloat(CGFloat(rAngle2)) + self.labelM.bounds.size.height + CGFloat(rAngle1)
                )
            }
        }
        
        UIView.animateKeyframes(withDuration: 2.5, delay: 0.5, options: [], animations: animLabelLBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [], animations: animLabelA1Block, completion: nil)
        UIView.animateKeyframes(withDuration: 2.5, delay: 0.4, options: [], animations: animLabelMBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [], animations: animLabelBBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 2.5, delay: 0.75, options: [], animations: animLabelDBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [], animations: animLabelA2Block, completion: nil)
    }
    
    private func animateBack() {
        
        let y = 55
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.labelL.center = CGPoint(x: 20, y: y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.labelA1.center = CGPoint(x: 85, y: y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.labelM.center = CGPoint(x: 160, y: y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.labelB.center = CGPoint(x: 235, y: y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.labelD.center = CGPoint(x: 295, y: y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.labelA2.center = CGPoint(x: 355, y: y)
            }
        })
        
        let animImageViewBlock = {
            UIView.animateKeyframes(withDuration: 1.5, delay: 0.75, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi/4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.20, relativeDuration: 0.25) {
                self.imageView.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(translationX: 0, y: -50)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.imageView.transform = .identity
            }
        }, completion: nil)
        }
        
        UIView.animateKeyframes(withDuration: 3.5, delay: 0, options: [], animations: animImageViewBlock, completion: nil)
        
        UIView.animate(withDuration: 3.5, delay: 1.0, options: [], animations: {
            self.imageView.transform = .identity
        })
        
        for label in [labelL, labelA1, labelM, labelB, labelD, labelA2] {
            UIView.animateKeyframes(withDuration: 2.5, delay: 0.5, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.5) {
                    label?.layer.backgroundColor = UIColor.clear.cgColor
                }
                UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0) {
                    label?.textColor = .black
                }
                
                UIViewPropertyAnimator(duration: 2.5, curve: .easeOut, animations: {
                    label!.alpha = 1.0
                    
                }).startAnimation()
                
                UIViewPropertyAnimator(duration: 2.5, curve: .easeOut, animations: {
                    label?.transform = .identity
                }).startAnimation()
            })
        }
    }
}


   func randomCGFloat() -> CGFloat {
   return CGFloat(arc4random()) / CGFloat(UInt32.max)
}

    extension UIColor {
      static func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        let alpha = randomCGFloat()
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
      }
    }

