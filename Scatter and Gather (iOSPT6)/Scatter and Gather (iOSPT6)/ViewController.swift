//
//  ViewController.swift
//  Scatter and Gather (iOSPT6)
//
//  Created by Bohdan Tkachenko on 5/23/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isScattered = false
    
    private var imageView = UIImageView()
    private var lLabel = UILabel()
    private var aLabel = UILabel()
    private var mLabel = UILabel()
    private var bLabel = UILabel()
    private var dLabel = UILabel()
    private var lastALabel = UILabel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(toggleScatterPressed))
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        lLabel.text = "L"
        
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textAlignment = .center
        
        aLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        aLabel.text = "A"
        
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        mLabel.text = "M"
        
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        bLabel.text = "B"
        
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        dLabel.text = "D"
        
        lastALabel.translatesAutoresizingMaskIntoConstraints = false
        lastALabel.textAlignment = .center
        lastALabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        lastALabel.text = "A"
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(aLabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(lastALabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -160),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func toggleScatterPressed() {
        isScattered = !isScattered
        
        switch isScattered {
        case true:
            UIView.animate(withDuration: Double.random(in: 2...4), animations: {
                // alpha changes the transparency
                self.imageView.alpha = 0
                
                // MARK: - Position and Rotation
                
                var lLabelTransforms = CGAffineTransform.identity
                lLabelTransforms = lLabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width - 125),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                lLabelTransforms = lLabelTransforms.rotated(by: .pi*CGFloat.random(in: -4...4))
                
                var firstALabelTransforms = CGAffineTransform.identity
                firstALabelTransforms = firstALabelTransforms.translatedBy(x: CGFloat.random(in: -50...self.view.frame.size.width - 175),
                                                                           y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                firstALabelTransforms = firstALabelTransforms.rotated(by: .pi*CGFloat.random(in: -4...4))
                
                var mLabelTransforms = CGAffineTransform.identity
                mLabelTransforms = mLabelTransforms.translatedBy(x: CGFloat.random(in: -75...self.view.frame.size.width - 200),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                mLabelTransforms = mLabelTransforms.rotated(by: .pi*CGFloat.random(in: -4...4))
                
                var bLabelTransforms = CGAffineTransform.identity
                bLabelTransforms = bLabelTransforms.translatedBy(x: CGFloat.random(in: -125...self.view.frame.size.width - 250),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                bLabelTransforms = bLabelTransforms.rotated(by: .pi*CGFloat.random(in: -4...4))
                
                var dLabelTransforms = CGAffineTransform.identity
                dLabelTransforms = dLabelTransforms.translatedBy(x: CGFloat.random(in: -150...self.view.frame.size.width - 275),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                dLabelTransforms = dLabelTransforms.rotated(by: .pi*CGFloat.random(in: -4...4))
                
                var secondALabelTransforms = CGAffineTransform.identity
                secondALabelTransforms = secondALabelTransforms.translatedBy(x: CGFloat.random(in: -200...self.view.frame.size.width - 350),
                                                                             y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
                secondALabelTransforms = secondALabelTransforms.rotated(by: .pi*CGFloat.random(in: -4...4))
                
                self.lLabel.transform = lLabelTransforms
                self.aLabel.transform = firstALabelTransforms
                self.mLabel.transform = mLabelTransforms
                self.bLabel.transform = bLabelTransforms
                self.dLabel.transform = dLabelTransforms
                self.lastALabel.transform = secondALabelTransforms
                
                // Mark: Changing backgroundColor on labels
                self.lLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
                
                self.aLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
                
                self.mLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
                
                self.bLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
                
                self.dLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
                
                self.lastALabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                          green: CGFloat.random(in: 0...1),
                                                          blue: CGFloat.random(in: 0...1),
                                                          alpha: 1)
                
                // Mark: Changing text color
                
                self.lLabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                green: CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1)
                
                self.aLabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                green: CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1)
                
                self.mLabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                green: CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1)
                
                self.bLabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                green: CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1)
                
                self.dLabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                green: CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1)
                
                self.lastALabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                    green: CGFloat.random(in: 0...1),
                                                    blue: CGFloat.random(in: 0...1),
                                                    alpha: 1)
            })
        case false:
            UIView.animate(withDuration: Double.random(in: 1...4)) {
                self.imageView.alpha = 1
                
                // Return rotation and position
                
                self.lLabel.transform = .identity
                self.aLabel.transform = .identity
                self.mLabel.transform = .identity
                self.bLabel.transform = .identity
                self.dLabel.transform = .identity
                self.lastALabel.transform = .identity
                
                // Return background color
                
                self.lLabel.backgroundColor = .white
                self.aLabel.backgroundColor = .white
                self.mLabel.backgroundColor = .white
                self.bLabel.backgroundColor = .white
                self.dLabel.backgroundColor = .white
                self.lastALabel.backgroundColor = .white
                
                // Return text color
                
                self.lLabel.textColor = .black
                self.aLabel.textColor = .black
                self.mLabel.textColor = .black
                self.bLabel.textColor = .black
                self.dLabel.textColor = .black
                self.lastALabel.textColor = .black
            }
        }
    }
}

