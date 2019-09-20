//
//  ViewController.swift
//  Scatter
//
//  Created by John Kouris on 9/20/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let letter1 = UILabel()
    let letter2 = UILabel()
    let letter3 = UILabel()
    let letter4 = UILabel()
    let letter5 = UILabel()
    let letter6 = UILabel()
    let image = UIImageView()
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabelsAndImage()
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        runAnimation()
    }
    
    private func configureLabelsAndImage() {
        
        letter1.translatesAutoresizingMaskIntoConstraints = false
        letter1.text = "L"
        letter1.font = UIFont.systemFont(ofSize: 40)
        
        letter2.translatesAutoresizingMaskIntoConstraints = false
        letter2.text = "a"
        letter2.font = UIFont.systemFont(ofSize: 40)
        
        letter3.translatesAutoresizingMaskIntoConstraints = false
        letter3.text = "m"
        letter3.font = UIFont.systemFont(ofSize: 40)
        
        letter4.translatesAutoresizingMaskIntoConstraints = false
        letter4.text = "b"
        letter4.font = UIFont.systemFont(ofSize: 40)
        
        letter5.translatesAutoresizingMaskIntoConstraints = false
        letter5.text = "d"
        letter5.font = UIFont.systemFont(ofSize: 40)
        
        letter6.translatesAutoresizingMaskIntoConstraints = false
        letter6.text = "a"
        letter6.font = UIFont.systemFont(ofSize: 40)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        image.image = UIImage(named: "lambda_logo")
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(letter1)
        stackView.addArrangedSubview(letter2)
        stackView.addArrangedSubview(letter3)
        stackView.addArrangedSubview(letter4)
        stackView.addArrangedSubview(letter5)
        stackView.addArrangedSubview(letter6)
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        image.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func runAnimation() {
        if isScattered {
            isScattered = false
            UIView.animate(withDuration: 2) {
                self.image.alpha = 1
                self.letter1.transform = .identity
                self.letter2.transform = .identity
                self.letter3.transform = .identity
                self.letter4.transform = .identity
                self.letter5.transform = .identity
                self.letter6.transform = .identity
            }
        } else {
            isScattered = true
            
            let animationBlock = {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    self.letter1.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...2*CGFloat.pi))
                    self.letter2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...2*CGFloat.pi))
                    self.letter3.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...2*CGFloat.pi))
                    self.letter4.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...2*CGFloat.pi))
                    self.letter5.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...2*CGFloat.pi))
                    self.letter6.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...2*CGFloat.pi))
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.9, animations: {
                    self.image.alpha = 0
                    self.letter1.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
                    self.letter2.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
                    self.letter3.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
                    self.letter4.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
                    self.letter5.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
                    self.letter6.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
//                    self.letter1.center = CGPoint(x: CGFloat.random(in: 0...self.view.frame.width), y: CGFloat.random(in: 0...self.view.frame.height))
                })
                
                
                
            }
            
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animationBlock, completion: nil)
        }
    }
    


}

