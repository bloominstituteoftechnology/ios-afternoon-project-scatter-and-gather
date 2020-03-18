//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Nichole Davidson on 3/17/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    var lLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var a2Label = UILabel()
    var imageView = UIImageView(image: UIImage(named: "lambda_logo"))
    var stackView = UIStackView()
    
    var isScattered = Bool()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureObjects()
    }
    
    func viewDidLoad(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    // MARK: - Private
    
    private func configureObjects() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 3, constant: 1).isActive = true
        
        
        view.addSubview(lLabel)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        lLabel.textColor = .black
        
        view.addSubview(aLabel)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        aLabel.text = "A"
        aLabel.textAlignment = .center
        aLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        aLabel.textColor = .black
        
        view.addSubview(mLabel)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        mLabel.textColor = .black
        
        view.addSubview(bLabel)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        bLabel.textColor = .black
        
        view.addSubview(dLabel)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        dLabel.textColor = .black
        
        view.addSubview(a2Label)
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        a2Label.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        a2Label.text = "A"
        a2Label.textAlignment = .center
        a2Label.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        a2Label.textColor = .black
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(aLabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(a2Label)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
            
        ])
    }
    
    
    private func random_angle() -> CGFloat  {
        let random = CGFloat.random(in: 1...8)
        return random
    }
    
    private func randomXPosition() -> CGFloat  {
        let random = CGFloat.random(in: 1..<100)
        return random
    }
    
    private func randomYPosition() -> CGFloat  {
        let random = CGFloat.random(in: 1..<500)
        return random
    }
    
    private func randomIntColor() -> Int {
        let random = Int.random(in: 10...100)
        return random
    }
    
    private func randomColor() -> UIColor {
     
        let random = UIColor(red: CGFloat(self.randomIntColor())/255, green: CGFloat(self.randomIntColor())/255, blue: CGFloat(self.randomIntColor())/255, alpha: 0.7)
        return random
    }
    
    var random: UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
    
        isScattered.toggle()
        
        if isScattered == true {
            UIImageView.animate(withDuration: 3) {
                self.imageView.alpha = 0
            }
            
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
                self.lLabel.transform = CGAffineTransform(rotationAngle: self.random_angle())
                self.aLabel.transform = CGAffineTransform(rotationAngle: self.random_angle())
                self.mLabel.transform = CGAffineTransform(rotationAngle: self.random_angle())
                self.bLabel.transform = CGAffineTransform(rotationAngle: self.random_angle())
                self.dLabel.transform = CGAffineTransform(rotationAngle: self.random_angle())
                self.a2Label.transform = CGAffineTransform(rotationAngle: self.random_angle())
            }, completion: nil)
            
            UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
                self.lLabel.transform = CGAffineTransform(translationX: self.randomXPosition(), y: self.randomYPosition())
                self.aLabel.transform = CGAffineTransform(translationX: self.randomXPosition(), y: self.randomYPosition())
                self.mLabel.transform = CGAffineTransform(translationX: self.randomXPosition(), y: self.randomYPosition())
                self.bLabel.transform = CGAffineTransform(translationX: self.randomXPosition(), y: self.randomYPosition())
                self.dLabel.transform = CGAffineTransform(translationX: -self.randomXPosition(), y: self.randomYPosition())
                self.a2Label.transform = CGAffineTransform(translationX: -self.randomXPosition(), y: self.randomYPosition())
            }, completion: nil)
            
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                
                self.lLabel.layer.backgroundColor = self.randomColor().cgColor
                self.aLabel.layer.backgroundColor = self.randomColor().cgColor
                self.mLabel.layer.backgroundColor = self.randomColor().cgColor
                self.bLabel.layer.backgroundColor = self.randomColor().cgColor
                self.dLabel.layer.backgroundColor = self.randomColor().cgColor
                self.a2Label.layer.backgroundColor = self.randomColor().cgColor
                
                self.lLabel.textColor = self.randomColor()
                self.aLabel.textColor = self.randomColor()
                self.mLabel.textColor = self.randomColor()
                self.bLabel.textColor = self.randomColor()
                self.dLabel.textColor = self.randomColor()
                self.a2Label.textColor = self.randomColor()
                
            }, completion: nil)
            
            
        } else {
            UIImageView.animate(withDuration: 1) {
                self.imageView.alpha = 1
            }
            lLabel.transform = .identity
            aLabel.transform = .identity
            mLabel.transform = .identity
            bLabel.transform = .identity
            dLabel.transform = .identity
            a2Label.transform = .identity
        }
    }
}

