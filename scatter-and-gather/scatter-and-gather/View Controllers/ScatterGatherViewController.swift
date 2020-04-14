//
//  ScatterGatherViewController.swift
//  scatter-and-gather
//
//  Created by Hunter Oppel on 4/14/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class ScatterGatherViewController: UIViewController {
    
    // MARK: Properties
    
    private var isScattered: Bool = false
    
    private var imageView = UIImageView()
    private var lLabel = UILabel()
    private var firstALabel = UILabel()
    private var mLabel = UILabel()
    private var bLabel = UILabel()
    private var dLabel = UILabel()
    private var secondALabel = UILabel()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(toggleScatterPressed))
        setUpSubviews()
    }
    
    // MARK: - Private Functions
    
    private func setUpSubviews() {
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 25)
        lLabel.text = "L"
        
        firstALabel.translatesAutoresizingMaskIntoConstraints = false
        firstALabel.textAlignment = .center
        firstALabel.font = UIFont.systemFont(ofSize: 25)
        firstALabel.text = "A"
        
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 25)
        mLabel.text = "M"
        
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 25)
        bLabel.text = "B"
        
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 25)
        dLabel.text = "D"
        
        secondALabel.translatesAutoresizingMaskIntoConstraints = false
        secondALabel.textAlignment = .center
        secondALabel.font = UIFont.systemFont(ofSize: 25)
        secondALabel.text = "A"
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(firstALabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(secondALabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func toggleScatterPressed() {
        isScattered = !isScattered
        
        switch isScattered {
        case true:
            UIView.animate(withDuration: Double.random(in: 2...4), animations: {
                self.imageView.alpha = 0
                
                // MARK: - Position and Rotation
                
                var lLabelTransforms = CGAffineTransform.identity
                lLabelTransforms = lLabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height))
                lLabelTransforms = lLabelTransforms.rotated(by: .pi*CGFloat.random(in: -2...2))
                
                var firstALabelTransforms = CGAffineTransform.identity
                firstALabelTransforms = firstALabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                                                                           y: CGFloat.random(in: 0...self.view.frame.size.height))
                firstALabelTransforms = firstALabelTransforms.rotated(by: .pi*CGFloat.random(in: -2...2))
                
                var mLabelTransforms = CGAffineTransform.identity
                mLabelTransforms = mLabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height))
                mLabelTransforms = mLabelTransforms.rotated(by: .pi*CGFloat.random(in: -2...2))
                
                var bLabelTransforms = CGAffineTransform.identity
                bLabelTransforms = bLabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height))
                bLabelTransforms = bLabelTransforms.rotated(by: .pi*CGFloat.random(in: -2...2))
                
                var dLabelTransforms = CGAffineTransform.identity
                dLabelTransforms = dLabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                                                                 y: CGFloat.random(in: 0...self.view.frame.size.height))
                dLabelTransforms = dLabelTransforms.rotated(by: .pi*CGFloat.random(in: -2...2))
                
                var secondALabelTransforms = CGAffineTransform.identity
                secondALabelTransforms = secondALabelTransforms.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                                                                             y: CGFloat.random(in: 0...self.view.frame.size.height))
                secondALabelTransforms = secondALabelTransforms.rotated(by: .pi*CGFloat.random(in: -2...2))
                
                self.lLabel.transform = lLabelTransforms
                self.firstALabel.transform = firstALabelTransforms
                self.mLabel.transform = mLabelTransforms
                self.bLabel.transform = bLabelTransforms
                self.dLabel.transform = dLabelTransforms
                self.secondALabel.transform = secondALabelTransforms
                
                // MARK: - Background Color Change
                // I don't know why it isn't animated since it is in the animate section
                self.lLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
                
                self.firstALabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
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
                
                self.secondALabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                            green: CGFloat.random(in: 0...1),
                                                            blue: CGFloat.random(in: 0...1),
                                                            alpha: 1)
                
                // MARK: - Text Color Change
                
                self.lLabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                green: CGFloat.random(in: 0...1),
                                                blue: CGFloat.random(in: 0...1),
                                                alpha: 1)
                
                self.firstALabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
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
                
                self.secondALabel.textColor = UIColor(red: CGFloat.random(in: 0...1),
                                                      green: CGFloat.random(in: 0...1),
                                                      blue: CGFloat.random(in: 0...1),
                                                      alpha: 1)
            })
        case false:
            UIView.animate(withDuration: Double.random(in: 2...4)) {
                self.imageView.alpha = 1
                
                // Revert rotation and position
                
                self.lLabel.transform = .identity
                self.firstALabel.transform = .identity
                self.mLabel.transform = .identity
                self.bLabel.transform = .identity
                self.dLabel.transform = .identity
                self.secondALabel.transform = .identity
                
                // Revert background color
                
                self.lLabel.backgroundColor = .white
                self.firstALabel.backgroundColor = .white
                self.mLabel.backgroundColor = .white
                self.bLabel.backgroundColor = .white
                self.dLabel.backgroundColor = .white
                self.secondALabel.backgroundColor = .white
                
                // Revert text color
                
                self.lLabel.textColor = .black
                self.firstALabel.textColor = .black
                self.mLabel.textColor = .black
                self.bLabel.textColor = .black
                self.dLabel.textColor = .black
                self.secondALabel.textColor = .black
            }
        }
    }
}
