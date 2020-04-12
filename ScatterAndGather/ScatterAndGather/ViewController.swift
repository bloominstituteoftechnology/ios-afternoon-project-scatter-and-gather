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
        configureLabels()
        // Do any additional setup after loading the view.
    }

    private func configureLabels() {
        labelL = UILabel(frame: CGRect(x: 10, y: 155, width: 50, height: 50))
        labelL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelL)
        
        labelL.text = "L"
        labelL.textAlignment = .center
        labelL.tintColor = .black
        labelL.font = UIFont.systemFont(ofSize: 86)
        
        labelA1 = UILabel(frame: CGRect(x: 55, y: 155, width: 50, height: 50))
        labelA1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelA1)
        
        labelA1.text = "a"
        labelA1.textAlignment = .center
        labelA1.tintColor = .black
        labelA1.font = UIFont.systemFont(ofSize: 86)
        
        labelM = UILabel(frame: CGRect(x: 100, y: 155, width: 50, height: 50))
        labelM.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelM)
        
        labelM.text = "m"
        labelM.textAlignment = .center
        labelM.tintColor = .black
        labelM.font = UIFont.systemFont(ofSize: 86)
        
        labelB = UILabel(frame: CGRect(x: 145, y: 155, width: 50, height: 50))
        labelB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelB)
        
        labelB.text = "b"
        labelB.textAlignment = .center
        labelB.tintColor = .black
        labelB.font = UIFont.systemFont(ofSize: 86)
        
        labelD = UILabel(frame: CGRect(x: 190, y: 155, width: 50, height: 50))
        labelD.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelD)
       
        labelD.text = "d"
        labelD.textAlignment = .center
        labelD.tintColor = .black
        labelD.font = UIFont.systemFont(ofSize: 86)
        
        labelA2 = UILabel(frame: CGRect(x: 235, y: 155, width: 50, height: 50))
        labelA2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelA2)
        
        labelA2.text = "a"
        labelA2.textAlignment = .center
        labelA2.tintColor = .black
        labelA2.font = UIFont.systemFont(ofSize: 86)
        
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
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
    }

    @IBAction func toggleButtpnPressed(_ sender: Any) {
        isToggled.toggle()
        if isToggled {
            UIViewPropertyAnimator(duration: 1.5, curve: .easeOut, animations: {
                self.imageView.alpha = 0.0
            }).startAnimation()
       // imageView.isHidden = true
            animateOut()
        } else {
            UIViewPropertyAnimator(duration: 1.5, curve: .easeOut, animations: {
                self.imageView.alpha = 1.0
            }).startAnimation()
           // imageView.isHidden = false
            animateBack()
        }
    }
    
    private func animateOut() {
        let animLabelLBlock = {
            
            self.labelL.backgroundColor = .blue
            self.labelL.textColor = .cyan
            
            let randomAngle1 = Int.random(in: 1...100)
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle1))
            }
            
            let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle2))
            }
            
            let random3 = Int.random(in: 0...50)
            let random4 = Int.random(in: 10...100)
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.80) {
                self.labelL.center = CGPoint(
                    x: CGFloat(random3) + self.labelL.bounds.size.width + CGFloat(randomAngle2),
                    y: self.view.center.y + CGFloat(random4)
                )
            }
           
        }
        
        let animLabelA1Block = {
            
            self.labelA1.backgroundColor = .darkGray
            self.labelA1.textColor = .systemBlue
            
            let randomAngle1 = Int.random(in: 1...100)

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.labelA1.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle1))
            }
            
            let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.labelA1.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.80) {
                self.labelA1.center = CGPoint(
                   // x: self.view.bounds.size.height + CGFloat(randomAngle1),
                    x: CGFloat(randomAngle2) + self.labelA1.bounds.size.height,
                    y: CGFloat(randomAngle2)
                )
            }
        }
        
        let animLabelMBlock = {
            
            self.labelM.backgroundColor = .systemGreen
            self.labelM.textColor = .systemYellow
            
            let randomAngle1 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle1))
            }
            
            let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.80) {
                self.labelM.center = CGPoint(
                    x: CGFloat(CGFloat(randomAngle2)),
                    y: self.view.bounds.size.width + self.labelM.bounds.size.height
                )
            }
        }
        
        let animLabelBBlock = {
            
            self.labelB.backgroundColor = .systemRed
            self.labelB.textColor = .systemGray
            
            let randomAngle1 = Int.random(in: 10...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle1))
            }
            
            let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.80) {
                self.labelM.center = CGPoint(
                    x: CGFloat(CGFloat(randomAngle2)),
                    y: self.view.bounds.size.width + self.labelB.bounds.size.height
                )
            }
        }
        
        let animLabelDBlock = {
            
            self.labelD.backgroundColor = .systemTeal
            self.labelD.textColor = .brown
            
            let randomAngle1 = Int.random(in: 10...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle1))
            }
            
            let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.80) {
                self.labelD.center = CGPoint(
                    x: CGFloat(CGFloat(randomAngle2)),
                    y: self.view.bounds.size.width + self.labelM.bounds.size.height
                )
            }
        }
        
        let animLabelA2Block = {
            
            self.labelA2.backgroundColor = .black
            self.labelA2.textColor = .systemRed
            
            let randomAngle1 = Int.random(in: 10...100)
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle1))
            }
            
            let randomAngle2 = Int.random(in: 0...100)
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle2))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.80) {
                self.labelA2.center = CGPoint(
                    x: CGFloat(CGFloat(randomAngle2)),
                    y: self.view.bounds.size.width + self.labelM.bounds.size.height
                )
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelLBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelA1Block, completion: nil)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelMBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelBBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelDBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelA2Block, completion: nil)
    }
    
    private func animateBack() {
        
    }
}

