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
    
    func generateRandomColor() -> UIColor{
        var random: UIColor{
            let r: CGFloat = .random(in: 0...1)
            let g: CGFloat = .random(in: 0...1)
            let b: CGFloat = .random(in: 0...1)
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        return random
    }
    
    @objc func togglePressed() {
        
        if self.isScattered {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                let minX = Int(self.view.bounds.minX)
                let maxX = Int(self.view.bounds.maxX - 50)
                
                let minY = Int(self.view.bounds.minY)
                let maxY = Int(self.view.bounds.maxY - 150)
                
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    self.imageView.alpha = 0
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    
                    let X = Int.random(in: minX...maxX)
                    let Y = Int.random(in: minY...maxY)
                    
                    let newCenter = CGPoint(x: X, y: Y)
                    
                    self.l.center = newCenter
                    self.l.textColor = self.generateRandomColor()
                    self.l.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    self.l.alpha = 0
                    self.l.backgroundColor = self.generateRandomColor()
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    let X = Int.random(in: minX...maxX)
                    let Y = Int.random(in: minY...maxY)
                    
                    let newCenter = CGPoint(x: X, y: Y)
                    
                    self.a.center = newCenter
                    self.a.textColor = self.generateRandomColor()
                    self.a.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    self.a.alpha = 0
                    self.a.backgroundColor = self.generateRandomColor()
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    let X = Int.random(in: minX...maxX)
                    let Y = Int.random(in: minY...maxY)
                    
                    let newCenter = CGPoint(x: X, y: Y)
                    
                    self.m.center = newCenter
                    self.m.textColor = self.generateRandomColor()
                    self.m.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    self.m.backgroundColor = self.generateRandomColor()
                    self.m.alpha = 0
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    let X = Int.random(in: minX...maxX)
                    let Y = Int.random(in: minY...maxY)
                    
                    let newCenter = CGPoint(x: X, y: Y)
                    
                    self.b.center = newCenter
                    self.b.textColor = self.generateRandomColor()
                    self.b.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    self.b.backgroundColor = self.generateRandomColor()
                    self.b.alpha = 0
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    let X = Int.random(in: minX...maxX)
                    let Y = Int.random(in: minY...maxY)
                    
                    let newCenter = CGPoint(x: X, y: Y)
                    
                    self.d.center = newCenter
                    self.d.textColor = self.generateRandomColor()
                    self.d.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    self.d.backgroundColor = self.generateRandomColor()
                    self.d.alpha = 0
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    let X = Int.random(in: minX...maxX)
                    let Y = Int.random(in: minY...maxY)
                    
                    let newCenter = CGPoint(x: X, y: Y)
                    
                    self.a2.center = newCenter
                    self.a2.textColor = self.generateRandomColor()
                    self.a2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    self.a2.backgroundColor = self.generateRandomColor()
                    self.a2.alpha = 0
                })
                
            })
            
        } else {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    self.imageView.alpha = 1
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    
                    self.l.center =  CGPoint(x: 7, y: 15)
                    self.l.backgroundColor = .clear
                    self.l.textColor = .black
                    self.l.transform = .identity
                    self.l.alpha = 1
                   
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.a.center =  CGPoint(x: 76.5, y: 15)
                    self.a.backgroundColor = .clear
                    self.a.textColor = .black
                    self.a.transform = .identity
                    self.a.alpha = 1
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.m.center =  CGPoint(x: 150, y: 15)
                    self.m.backgroundColor = .clear
                    self.m.textColor = .black
                    self.m.transform = .identity
                    self.m.alpha = 1
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.b.center =  CGPoint(x: 225.75, y: 15)
                    self.b.backgroundColor = .clear
                    self.b.textColor = .black
                    self.b.transform = .identity
                    self.b.alpha = 1
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.d.center =  CGPoint(x: 293.5, y: 15)
                    self.d.backgroundColor = .clear
                    self.d.textColor = .black
                    self.d.transform = .identity
                    self.d.alpha = 1
                })
                
                UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {
                    self.a2.center =  CGPoint(x: 365, y: 15)
                    self.a2.backgroundColor = .clear
                    self.a2.textColor = .black
                    self.a2.transform = .identity
                    self.a2.alpha = 1
                })
                
                
            })
        }
        
        self.isScattered = !self.isScattered
    }
    
}

