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
    
    private func labelAnimation(label: UILabel, x xPoint: CGFloat) {
        let randomRotation = CGFloat.random(in: 1...4)
        
        if isScattered {
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    label.center = CGPoint(x: CGFloat.random(in: -100...self.view.bounds.maxX), y: CGFloat.random(in: 50...self.view.bounds.maxY))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    label.backgroundColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                    label.textColor = UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
                }
            }, completion: nil)
        }
        
        else {
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    label.center = CGPoint(x: xPoint, y: 36)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    label.transform = .identity
                    label.backgroundColor = .clear
                    label.textColor = .black
                }
            }, completion: nil)
        }
    }
    
    private func animateLabels() {
        labelAnimation(label: lLabel, x: 20)
        labelAnimation(label: a1Label, x: 75)
        labelAnimation(label: mLabel, x: 130)
        labelAnimation(label: bLabel, x: 185 )
        labelAnimation(label: dLabel, x: 240)
        labelAnimation(label: a2Label, x: 295)
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

