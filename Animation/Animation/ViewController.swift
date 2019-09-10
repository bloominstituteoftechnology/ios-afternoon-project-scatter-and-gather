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
    
    var isScattered: Bool = false
    
    private var l: UILabel!
    private var a: UILabel!
    private var m: UILabel!
    private var b: UILabel!
    private var d: UILabel!
    private var a2: UILabel!
    private var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubViews()
    }
    
    private func setSubViews() {
        
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .done, target: self, action: #selector(togglePressed))
        navigationItem.rightBarButtonItem = toggleButton
        
        let lLabel = UILabel()
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        self.l = lLabel
        
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "A"
        aLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        self.a = aLabel
        
        let mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "M"
        mLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        self.m = mLabel
        
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "B"
        bLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        self.b = bLabel
        
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "D"
        dLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        self.d = dLabel
        
        let lastALabel = UILabel()
        lastALabel.translatesAutoresizingMaskIntoConstraints = false
        lastALabel.text = "A"
        lastALabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        self.a2 = lastALabel
        
        let stackView = UIStackView(arrangedSubviews: [lLabel, aLabel, mLabel, bLabel, dLabel, lastALabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        
        view.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        
        self.imageView = imageView
        
        
    }
    
    func reorganizeLetters(label: UILabel) {
        
        UIView.animate(withDuration: 2.5) {
            label.transform = .identity
            label.alpha = 1
        }
        
    }
    
    func randomLetters(label: UILabel) {
        
        let minX = Int(self.view.bounds.minX)
        let maxX = Int(self.view.bounds.maxX - 50)
        
        let minY = Int(self.view.bounds.minY)
        let maxY = Int(self.view.bounds.maxY - 150)
        
        let randomX = Int.random(in: minX...maxX)
        let randomY = Int.random(in: minY...maxY)
        
        let randomPoint = CGPoint(x: randomX, y: randomY)
        
        UIView.animate(withDuration: 2.5) {
            
            label.center = randomPoint
            label.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
            label.textColor = self.generateRandomColor()
            label.backgroundColor = self.generateRandomColor()
        }
        
    }
    
    func generateRandomColor() -> UIColor{
        var random: UIColor {
            let r: CGFloat = .random(in: 0...1)
            let g: CGFloat = .random(in: 0...1)
            let b: CGFloat = .random(in: 0...1)
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        return random
    }
    
    func clearSettings(label: UILabel) {
        
        label.backgroundColor = .clear
        label.textColor = .black
        
    }
    
    @objc func togglePressed() {
        
        self.isScattered = !self.isScattered
        
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.imageView.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1, animations: {
                self.imageView.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 0.8, animations: {
                self.randomLetters(label: self.l)
            })
            
            UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 0.8, animations: {
                self.randomLetters(label: self.a)
            })
            
            UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 0.8, animations: {
                self.randomLetters(label: self.m)
            })
            
            UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 0.8, animations: {
                self.randomLetters(label: self.b)
            })
            
            UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 0.8, animations: {
                self.randomLetters(label: self.d)
            })
            
            UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 0.8, animations: {
                self.randomLetters(label: self.a2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                self.reorganizeLetters(label: self.l)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
               self.reorganizeLetters(label: self.a)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
               self.reorganizeLetters(label: self.m)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                self.reorganizeLetters(label: self.b)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
               self.reorganizeLetters(label: self.d)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                self.reorganizeLetters(label: self.a2)
            })

            
            
        }, completion: { (_) in
            self.clearSettings(label: self.l)
            self.clearSettings(label: self.a)
            self.clearSettings(label: self.m)
            self.clearSettings(label: self.b)
            self.clearSettings(label: self.d)
            self.clearSettings(label: self.a2)
            
            
        })
        
    }
    
}

