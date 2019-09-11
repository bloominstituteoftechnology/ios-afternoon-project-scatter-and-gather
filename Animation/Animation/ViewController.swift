//
//  ViewController.swift
//  Animation
//
//  Created by Alex Rhodes on 9/10/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var isScattered: Bool = true
    
    private var l: UILabel!
    private var a: UILabel!
    private var m: UILabel!
    private var b: UILabel!
    private var d: UILabel!
    private var a2: UILabel!
    private var moveMe: UILabel!
    private var imageView: UIImageView!
    private var recognizer: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubViews()
    }
    
    private func setSubViews() {
        
        navigationController?.navigationBar.barStyle = .blackTranslucent
        
        view.backgroundColor = .black
        
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .done, target: self, action: #selector(togglePressed))
        navigationItem.rightBarButtonItem = toggleButton
        toggleButton.tintColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        
        let lLabel = UILabel()
        lLabel.layer.cornerRadius = 6
        lLabel.layer.masksToBounds = true
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.textColor = .lightGray
        lLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        self.l = lLabel
        
        let aLabel = UILabel()
        aLabel.layer.cornerRadius = 6
        aLabel.layer.masksToBounds = true
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "A"
        aLabel.textColor = .lightGray
        aLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        self.a = aLabel
        
        let mLabel = UILabel()
        mLabel.layer.cornerRadius = 6
        mLabel.layer.masksToBounds = true
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "M"
        mLabel.textColor = .lightGray
        mLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        self.m = mLabel
        
        let bLabel = UILabel()
        bLabel.layer.cornerRadius = 6
        bLabel.layer.masksToBounds = true
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "B"
        bLabel.textColor = .lightGray
        bLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        self.b = bLabel
        
        let dLabel = UILabel()
        dLabel.layer.cornerRadius = 6
        dLabel.layer.masksToBounds = true
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "D"
        dLabel.textColor = .lightGray
        dLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        self.d = dLabel
        
        let lastALabel = UILabel()
        lastALabel.layer.cornerRadius = 6
        lastALabel.layer.masksToBounds = true
        lastALabel.translatesAutoresizingMaskIntoConstraints = false
        lastALabel.text = "A"
        lastALabel.textColor = .lightGray
        lastALabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        self.a2 = lastALabel
        
        let stackView = UIStackView(arrangedSubviews: [lLabel, aLabel, mLabel, bLabel, dLabel, lastALabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        let moveMe = UILabel()
        moveMe.translatesAutoresizingMaskIntoConstraints = false
        moveMe.text = "Move Me:"
        moveMe.textColor = .lightGray
        moveMe.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        moveMe.textAlignment = .center
        moveMe.isHidden = true
        
        view.addSubview(moveMe)
        
        moveMe.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        moveMe.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        moveMe.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30).isActive = true
        
        self.moveMe = moveMe
        
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = #imageLiteral(resourceName: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        
        view.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        imageView.topAnchor.constraint(equalTo: moveMe.bottomAnchor, constant: 20).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        
        self.imageView = imageView
        
        let recognizer = UIPanGestureRecognizer()
        
        view.addGestureRecognizer(recognizer)
        
        self.recognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan))
    }
    
    func generateRandomColor() -> UIColor{
        var random: UIColor{
            let r: CGFloat = .random(in: 0...1)
            let g: CGFloat = .random(in: 0...0.2)
            let b: CGFloat = .random(in: 0...0.2)
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        return random
    }
    
    func scatter(label: UILabel) {
        
        let minX = Int(self.view.bounds.minX)
        let maxX = Int(self.view.bounds.maxX - 50)
        
        let minY = Int(self.view.bounds.minY)
        let maxY = Int(self.view.bounds.maxY - 150)
        
        let X = Int.random(in: minX...maxX)
        let Y = Int.random(in: minY...maxY)
        
        let newCenter = CGPoint(x: X, y: Y)
        
        label.center = newCenter
        label.textColor = self.generateRandomColor()
        
        let rotationTransform = CATransform3DRotate(label.layer.transform, CGFloat.pi, 1, 0, 0)
        label.layer.transform = rotationTransform
        
        label.alpha = 0
        label.backgroundColor = self.generateRandomColor()
        
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
    }
    
    func bringBack(label: UILabel) {
        
        label.textColor = .lightGray
        label.backgroundColor = .clear
        label.transform = .identity
        label.alpha = 1
        
    }
    
    @objc func handlePan() {
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        imageView.isUserInteractionEnabled = true
    
    }
    
    @objc func togglePressed() {
        
        if self.isScattered {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                let labels = [self.l, self.a, self.m, self.b, self.d, self.a2]
                
                for label in labels {
                    label?.isHidden = false
                }
                
                self.moveMe.isHidden = true
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    self.imageView.alpha = 0
                    self.imageView.isUserInteractionEnabled = true
                    self.imageView.gestureRecognizerShouldBegin(self.recognizer)
                    self.imageView.addGestureRecognizer(self.recognizer)
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.scatter(label: self.l)
                    self.scatter(label: self.a)
                    self.scatter(label: self.m)
                    self.scatter(label: self.b)
                    self.scatter(label: self.d)
                    self.scatter(label: self.a2)
                    
                })
                
            })
            
        } else {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    
                    self.imageView.alpha = 1
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.l.center =  CGPoint(x: 11.25, y: 24)
                    self.bringBack(label: self.l)
                    
                    self.a.center =  CGPoint(x: 65.5, y: 24)
                    self.bringBack(label: self.a)
                    
                    self.m.center =  CGPoint(x: 126.5, y: 24)
                    self.bringBack(label: self.m)
                    
                    self.b.center =  CGPoint(x: 186, y: 24)
                    self.bringBack(label: self.b)
                    
                    self.d.center =  CGPoint(x: 242.75, y: 24)
                    self.bringBack(label: self.d)
                    
                    self.a2.center =  CGPoint(x: 300, y: 24)
                    self.bringBack(label: self.a2)
        
                })
                
            }) { (_) in
                
                let labels = [self.l, self.a, self.m, self.b, self.d, self.a2]
                
                for label in labels {
                    label?.isHidden = true
                }
                
                self.moveMe.isHidden = false
            }
        }
        self.isScattered = !self.isScattered
    }
    
}

