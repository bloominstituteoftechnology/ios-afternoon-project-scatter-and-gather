//
//  ViewController.swift
//  Scatter And Gather
//
//  Created by Joseph Rogers on 11/15/19.
//  Copyright © 2019 Moka Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    var isScattered: Bool = false
    var lambdaImage: UIImageView?
    let labelL = UILabel()
    let labelA = UILabel()
    let labelM = UILabel()
    let labelB = UILabel()
    let labelD = UILabel()
    let labelA2 = UILabel()
    let image: UIImage = UIImage(named: "lambda_logo")!
    
    //colorsForBackrounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButton(_:)))
        setupSubViews()
    }
    
    //MARK: Actions
    
    func setupSubViews() {
        
        view.addSubview(labelL)
        view.addSubview(labelA)
        view.addSubview(labelM)
        view.addSubview(labelB)
        view.addSubview(labelD)
        view.addSubview(labelA2)
        
        labelL.text = "L"
        labelA.text = "a"
        labelM.text = "m"
        labelB.text = "b"
        labelD.text = "d"
        labelA2.text = "a"
        
        labelL.textAlignment = .center
        labelA.textAlignment = .center
        labelM.textAlignment = .center
        labelB.textAlignment = .center
        labelD.textAlignment = .center
        labelA2.textAlignment = .center
        
        labelL.font = UIFont(name: "AmericanTypewriter", size: 60)
        labelA.font = UIFont(name: "AmericanTypewriter", size: 60)
        labelM.font = UIFont(name: "AmericanTypewriter", size: 60)
        labelB.font = UIFont(name: "AmericanTypewriter", size: 60)
        labelD.font = UIFont(name: "AmericanTypewriter", size: 60)
        labelA2.font = UIFont(name: "AmericanTypewriter", size: 60)
        
        labelL.translatesAutoresizingMaskIntoConstraints = false
        labelA.translatesAutoresizingMaskIntoConstraints = false
        labelM.translatesAutoresizingMaskIntoConstraints = false
        labelB.translatesAutoresizingMaskIntoConstraints = false
        labelD.translatesAutoresizingMaskIntoConstraints = false
        labelA2.translatesAutoresizingMaskIntoConstraints = false
        
        
        lambdaImage = UIImageView(image: image)
        lambdaImage?.translatesAutoresizingMaskIntoConstraints = false
        lambdaImage?.contentMode = .scaleAspectFit
        view.addSubview(lambdaImage!)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(labelL)
        stackView.addArrangedSubview(labelA)
        stackView.addArrangedSubview(labelM)
        stackView.addArrangedSubview(labelB)
        stackView.addArrangedSubview(labelD)
        stackView.addArrangedSubview(labelA2)
        
        
        //MARK: Constraints
        
        lambdaImage?.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        lambdaImage?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        lambdaImage?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        lambdaImage?.centerYAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 80).isActive = true
        
        
        NSLayoutConstraint.activate([
                   stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                   stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                   stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
               ])
        
    }
    
   
    
    //MARK: Actions
    
    private func randomTranslation(for label: UILabel) -> CGAffineTransform {
                   let minX = -label.frame.origin.x + self.view.safeAreaInsets.left
                   let maxX = self.view.frame.width - (label.frame.origin.x + label.frame.width + self.view.safeAreaInsets.right)
                   let x = (CGFloat.random(in: minX...maxX))
                   let minY = -label.frame.origin.y + self.view.safeAreaInsets.top
                   let maxY = self.view.frame.height - (label.frame.origin.y + label.frame.height + self.view.safeAreaInsets.bottom)
                   let y = (CGFloat.random(in: minY...maxY))
                   return CGAffineTransform(translationX: x, y: y).rotated(by: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
               }
    
    private func randomBackroundColor() {
        
    }
        
    
    
    @objc func toggleButton(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        if isScattered == true {
            
            UIImageView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.lambdaImage?.alpha = 0
                }
            }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                    self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 50...200)))
                    self.labelL.transform = self.randomTranslation(for: self.labelL)
                    self.labelL.layer.backgroundColor = CGColor(srgbRed: .random(), green: .random(), blue: .random(), alpha: 0.8)
                }
            }, completion: nil)
            
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                           UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                               self.labelA.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 50...200)))
                               self.labelA.transform = self.randomTranslation(for: self.labelA)
                            self.labelA.layer.backgroundColor = CGColor(srgbRed: .random(), green: .random(), blue: .random(), alpha: 0.8)
                           }
                       }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                                          self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 50...200)))
                                          self.labelM.transform = self.randomTranslation(for: self.labelM)
                                        self.labelM.layer.backgroundColor = CGColor(srgbRed: .random(), green: .random(), blue: .random(), alpha: 0.8)
                                      }
                                  }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                                          self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 50...200)))
                                          self.labelB.transform = self.randomTranslation(for: self.labelB)
                                        self.labelB.layer.backgroundColor = CGColor(srgbRed: .random(), green: .random(), blue: .random(), alpha: 0.8)
                                      }
                                  }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                                          self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 50...200)))
                                          self.labelD.transform = self.randomTranslation(for: self.labelD)
                                        self.labelD.layer.backgroundColor = CGColor(srgbRed: .random(), green: .random(), blue: .random(), alpha: 0.8)
                                      }
                                  }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                                          self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 50...200)))
                                          self.labelA2.transform = self.randomTranslation(for: self.labelA2)
                                        self.labelA2.layer.backgroundColor = CGColor(srgbRed: .random(), green: .random(), blue: .random(), alpha: 0.8)
                                      }
                                  }, completion: nil)
            
            
        } else if isScattered == false {
            
            UIImageView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.lambdaImage?.alpha = 1.0
                    
                }
            }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                            self.labelL.transform = .identity
                            self.labelL.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                           }
                       }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
            UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                        self.labelA.transform = .identity
                        self.labelA.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                       }
                   }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                  self.labelM.transform = .identity
                                  self.labelM.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                                 }
                             }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                  self.labelB.transform = .identity
                                  self.labelB.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                                 }
                             }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                  self.labelD.transform = .identity
                                  self.labelD.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                                 }
                             }, completion: nil)
            
            UILabel.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                      UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                  self.labelA2.transform = .identity
                                  self.labelA2.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                                 }
                             }, completion: nil)
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
