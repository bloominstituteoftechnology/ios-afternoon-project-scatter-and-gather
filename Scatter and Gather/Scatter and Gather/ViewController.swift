//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Clayton Watkins on 5/22/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var lLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var a2Label = UILabel()
    var logoImageView = UIImageView()
    var stackView = UIStackView()
    var isScattered: Bool = false
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLabels()
        configureImageView()
        configureNavButton()
    }
    
    //MARK: - Private Functions
    func getRandomNum(in range: ClosedRange<Int>) -> Int{
        let myNumber = Int.random(in: range)
        return myNumber
    }
    
    
    private func configureLabels(){
        // Creating stack view for labels
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        // Stack View Constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        // Adding labels to stack view
        // L
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.font = UIFont.boldSystemFont(ofSize: 75)
        lLabel.textColor = .red
        stackView.addArrangedSubview(lLabel)
        
        // A
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "A"
        aLabel.font = UIFont.boldSystemFont(ofSize: 75)
        aLabel.textColor = .blue
        stackView.addArrangedSubview(aLabel)
        
        // M
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "M"
        mLabel.font = UIFont.boldSystemFont(ofSize: 75)
        mLabel.textColor = .yellow
        stackView.addArrangedSubview(mLabel)
        
        // B
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "B"
        bLabel.font = UIFont.boldSystemFont(ofSize: 75)
        bLabel.textColor = .green
        stackView.addArrangedSubview(bLabel)
        
        // D
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "D"
        dLabel.font = UIFont.boldSystemFont(ofSize: 75)
        dLabel.textColor = .brown
        stackView.addArrangedSubview(dLabel)
        
        // A
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        a2Label.text = "A"
        a2Label.font = UIFont.boldSystemFont(ofSize: 75)
        a2Label.textColor = .purple
        stackView.addArrangedSubview(a2Label)
    }
    
    private func configureImageView(){
        // Setting up Image View
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "lambda_logo")
        view.addSubview(logoImageView)
        
        // Constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1)
        ])
    }
    
    private func configureNavButton(){
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonTapped))
        navigationItem.rightBarButtonItem = toggleButton
    }
    
    @objc func toggleButtonTapped(){
        if isScattered {
            gatherAnimation()
        } else {
            scatterAnimation()
        }
        isScattered.toggle()
    }
    
    private func scatterAnimation(){
        let animationBlock = {
            // Image view fade out
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                self.logoImageView.alpha = 0.0
            }
            
            //Scatter letters + random angles
            // L label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                // Random color generation
                let red   = CGFloat((arc4random() % 256)) / 255.0
                let green = CGFloat((arc4random() % 256)) / 255.0
                let blue  = CGFloat((arc4random() % 256)) / 255.0
                let alpha = CGFloat(1.0)
                let randomX = CGFloat(self.getRandomNum(in: 1...90))
                let randomY = CGFloat(self.getRandomNum(in: -1...500))
                let randomRotation = CGFloat(self.getRandomNum(in: 10...50))
                self.lLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                self.lLabel.transform = CGAffineTransform(translationX: randomX, y: randomY).rotated(by: randomRotation)
            }
            // A label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                // Random color generation
                let red   = CGFloat((arc4random() % 256)) / 255.0
                let green = CGFloat((arc4random() % 256)) / 255.0
                let blue  = CGFloat((arc4random() % 256)) / 255.0
                let alpha = CGFloat(1.0)
                let randomX = CGFloat(self.getRandomNum(in: 1...90))
                let randomY = CGFloat(self.getRandomNum(in: -1...500))
                let randomRotation = CGFloat(self.getRandomNum(in: 10...50))
                
                self.aLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                self.aLabel.transform = CGAffineTransform(translationX: randomX, y: randomY).rotated(by: randomRotation)
            }
            // M label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                // Random color generation
                let red   = CGFloat((arc4random() % 256)) / 255.0
                let green = CGFloat((arc4random() % 256)) / 255.0
                let blue  = CGFloat((arc4random() % 256)) / 255.0
                let alpha = CGFloat(1.0)
                let randomX = CGFloat(self.getRandomNum(in: 1...90))
                let randomY = CGFloat(self.getRandomNum(in: -1...500))
                let randomRotation = CGFloat(self.getRandomNum(in: 10...50))
                
                self.mLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                self.mLabel.transform = CGAffineTransform(translationX: randomX, y: randomY).rotated(by: randomRotation)
            }
            // B label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                // Random color generation
                let red   = CGFloat((arc4random() % 256)) / 255.0
                let green = CGFloat((arc4random() % 256)) / 255.0
                let blue  = CGFloat((arc4random() % 256)) / 255.0
                let alpha = CGFloat(1.0)
                let randomX = CGFloat(self.getRandomNum(in: 1...90))
                let randomY = CGFloat(self.getRandomNum(in: -1...500))
                let randomRotation = CGFloat(self.getRandomNum(in: 10...50))
                
                self.bLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                self.bLabel.transform = CGAffineTransform(translationX: randomX, y: randomY).rotated(by: randomRotation)
            }
            // D label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                // Random color generation
                let red   = CGFloat((arc4random() % 256)) / 255.0
                let green = CGFloat((arc4random() % 256)) / 255.0
                let blue  = CGFloat((arc4random() % 256)) / 255.0
                let alpha = CGFloat(1.0)
                let randomX = CGFloat(self.getRandomNum(in: 1...90))
                let randomY = CGFloat(self.getRandomNum(in: -1...500))
                let randomRotation = CGFloat(self.getRandomNum(in: 10...50))
                
                self.dLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                self.dLabel.transform = CGAffineTransform(translationX: randomX, y: randomY).rotated(by: randomRotation)
            }
            // A label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                let red   = CGFloat((arc4random() % 256)) / 255.0
                let green = CGFloat((arc4random() % 256)) / 255.0
                let blue  = CGFloat((arc4random() % 256)) / 255.0
                let alpha = CGFloat(1.0)
                let randomX = CGFloat(self.getRandomNum(in: 1...90))
                let randomY = CGFloat(self.getRandomNum(in: -1...500))
                let randomRotation = CGFloat(self.getRandomNum(in: 10...50))
                
                self.a2Label.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
                self.a2Label.transform = CGAffineTransform(translationX: randomX, y: randomY).rotated(by: randomRotation)
            }
            
            
        }
        UIView.animateKeyframes(withDuration: 2.0,
                                delay: 0.0,
                                options: [],
                                animations: animationBlock,
                                completion: nil)
        
    }
    
    func gatherAnimation(){
        let animationBlock = {
            // Image view fade in
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                self.logoImageView.alpha = 1.0
            }
            // Return to starting position
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                self.lLabel.transform = .identity
                self.aLabel.transform = .identity
                self.mLabel.transform = .identity
                self.bLabel.transform = .identity
                self.dLabel.transform = .identity
                self.a2Label.transform = .identity
                self.lLabel.backgroundColor = .white
                self.aLabel.backgroundColor = .white
                self.mLabel.backgroundColor = .white
                self.bLabel.backgroundColor = .white
                self.dLabel.backgroundColor = .white
                self.a2Label.backgroundColor = .white
            }
        }
        UIView.animateKeyframes(withDuration: 2.0,
                                delay: 0.0,
                                options: [],
                                animations: animationBlock,
                                completion: nil)
    }
}

