//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Tobi Kuyoro on 18/02/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    // MARK: - Properties
    
    var isScattered: Bool = false
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBarButton()
        setUpLabels()
        setUpImage()
    }
    
    // MARK: - Private
    
    private func setUpBarButton() {
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
        navigationItem.rightBarButtonItem = toggleButton
    }
    
    private func setUpLabels() {
        
        // "L" Label
        let lLabel = UILabel()
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 60)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lLabel = lLabel
        
        // "A1" Label
        let a1Label = UILabel()
        a1Label.text = "A"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 60)
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        self.a1Label = a1Label
        
        // "M" Label
        let mLabel = UILabel()
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 60)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mLabel = mLabel
        
        // "B" Label
        let bLabel = UILabel()
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 60)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bLabel = bLabel
        
        // "D" Label
        let dLabel = UILabel()
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 60)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dLabel = dLabel
        
        // "A2" Label
        let a2Label = UILabel()
        a2Label.text = "A"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 60)
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        self.a2Label = a2Label
        
        // StackView
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        self.stackView = stackView
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(a1Label)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(a2Label)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    private func setUpImage() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lambda_logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        self.lambdaLogo = imageView
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func animateLabels() {
        let randomRotation = CGFloat.random(in: 1...4)
        
        if isScattered {
            
            // "L" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.lLabel.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    self.lLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    self.lLabel.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
            
            // "A1" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a1Label.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a1Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    self.a1Label.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    self.a1Label.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
            
            // "M" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.mLabel.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    self.mLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    self.mLabel.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
            
            // "B" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.bLabel.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    self.bLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    self.bLabel.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
            
            // "D" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.dLabel.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    self.dLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    self.dLabel.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
            
            // "A2" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a2Label.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    self.a2Label.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    self.a2Label.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
        }
        
        else {
            // "L" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.lLabel.center = CGPoint(x: 20, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.lLabel.transform = .identity
                    self.lLabel.backgroundColor = .clear
                    self.lLabel.textColor = .black
                }
            }, completion: nil)
            
            // "A1" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a1Label.center = CGPoint(x: 75, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a1Label.transform = .identity
                    self.a1Label.backgroundColor = .clear
                    self.a1Label.textColor = .black
                }
            }, completion: nil)
            
            // "M" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.mLabel.center = CGPoint(x: 130, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.mLabel.transform = .identity
                    self.mLabel.backgroundColor = .clear
                    self.mLabel.textColor = .black
                }
            }, completion: nil)
            
            // "B" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.bLabel.center = CGPoint(x: 185, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.bLabel.transform = .identity
                    self.bLabel.backgroundColor = .clear
                    self.bLabel.textColor = .black
                }
            }, completion: nil)
            
            // "D" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.dLabel.center = CGPoint(x: 240, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.dLabel.transform = .identity
                    self.dLabel.backgroundColor = .clear
                    self.dLabel.textColor = .black
                }
            }, completion: nil)
            
            // "A2" Label
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a2Label.center = CGPoint(x: 295, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    self.a2Label.transform = .identity
                    self.a2Label.backgroundColor = .clear
                    self.a2Label.textColor = .black

                }
            }, completion: nil)
        }
    }
    
    private func animateLogo() {
        if isScattered {
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                    self.lambdaLogo.alpha = 0.5
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.0) {
                    self.lambdaLogo.alpha = 0
                }
            }, completion: nil)
        }
        
        else {
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                    self.lambdaLogo.alpha = 0.5
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.0) {
                    self.lambdaLogo.alpha = 1
                }
            }, completion: nil)
        }
    }
    
    // MARK: - Actions
    
    @objc func toggleButtonPressed() {
        isScattered.toggle()
        animateLabels()
        animateLogo()
    }
}

