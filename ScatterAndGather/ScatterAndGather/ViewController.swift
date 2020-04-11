//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Elizabeth Thomas on 4/10/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isScattered = Bool()
    private var lLabel = UILabel()
    private var firstALabel = UILabel()
    private var mLabel = UILabel()
    private var bLabel = UILabel()
    private var dLabel = UILabel()
    private var secondALabel = UILabel()
    private var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        configureLabelsAndImageView()
    }

    
    @objc private func toggleButtonTapped() {
        isScattered.toggle()
        
        switch isScattered {
        case true:
            scatterLetters()
        default:
            gatherLetters()
        }
    }
    
    
    private func configureButton() {
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonTapped))
        
        navigationItem.rightBarButtonItem = toggleButton
    }
    
    private func configureLabelsAndImageView() {
        
        //MARK: - Labels
        
        // Create and configure
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.font = UIFont(name: "American Typewriter", size: 30)
        
        firstALabel.translatesAutoresizingMaskIntoConstraints = false
        firstALabel.text = "a"
        firstALabel.font = UIFont(name: "American Typewriter", size: 30)
        
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "m"
        mLabel.font = UIFont(name: "American Typewriter", size: 30)
        
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "b"
        bLabel.font = UIFont(name: "American Typewriter", size: 30)
        
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "d"
        dLabel.font = UIFont(name: "American Typewriter", size: 30)
        
        secondALabel.translatesAutoresizingMaskIntoConstraints = false
        secondALabel.text = "a"
        secondALabel.font = UIFont(name: "American Typewriter", size: 30)
        
        // Add to view
        view.addSubview(lLabel)
        view.addSubview(firstALabel)
        view.addSubview(mLabel)
        view.addSubview(bLabel)
        view.addSubview(dLabel)
        view.addSubview(secondALabel)
        
        // Constraints and activation
        NSLayoutConstraint.activate([
        
            lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            firstALabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 40),
            firstALabel.topAnchor.constraint(equalTo: lLabel.topAnchor),
            
            mLabel.leadingAnchor.constraint(equalTo: firstALabel.trailingAnchor, constant: 40),
            mLabel.topAnchor.constraint(equalTo: lLabel.topAnchor),
            
            bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 40),
            bLabel.topAnchor.constraint(equalTo: lLabel.topAnchor),
            
            dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 40),
            dLabel.topAnchor.constraint(equalTo: lLabel.topAnchor),
            
            secondALabel.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 40),
            secondALabel.topAnchor.constraint(equalTo: lLabel.topAnchor)
            
        
        ])
        
        // MARK: - Image View
        
        imageView.image = UIImage(named: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
        
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: lLabel.bottomAnchor, constant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    private func scatterLetters() {

        let animationBlock = {
            
            // Fades out Lambda Logo
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.imageView.alpha = 0.0
            }
            
            // Changes color of letters
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.lLabel.backgroundColor = UIColor.random()
                self.lLabel.textColor = UIColor.random()
                
                self.firstALabel.backgroundColor = UIColor.random()
                self.firstALabel.textColor = UIColor.random()
                
                self.mLabel.backgroundColor = UIColor.random()
                self.mLabel.textColor = UIColor.random()
                
                self.bLabel.backgroundColor = UIColor.random()
                self.bLabel.textColor = UIColor.random()
                
                self.dLabel.backgroundColor = UIColor.random()
                self.dLabel.textColor = UIColor.random()
                
                self.secondALabel.backgroundColor = UIColor.random()
                self.secondALabel.textColor = UIColor.random()
            }
            
            // Changes position of letters
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.lLabel.transform = CGAffineTransform(
                    scaleX: .random(), y: .random()
                )
                self.firstALabel.transform = CGAffineTransform(
                    scaleX: .random(), y: .random()
                )
                self.mLabel.transform = CGAffineTransform(
                    scaleX: .random(), y: .random()
                )
                self.bLabel.transform = CGAffineTransform(
                    scaleX: .random(), y: .random()
                )
                self.dLabel.transform = CGAffineTransform(
                    scaleX: .random(), y: .random()
                )
                self.secondALabel.transform = CGAffineTransform(
                    scaleX: .random(), y: .random()
                )
            }
        
            // Changes rotation of letters
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.lLabel.transform = CGAffineTransform(rotationAngle: .random())
                self.firstALabel.transform = CGAffineTransform(rotationAngle: .random())
                self.mLabel.transform = CGAffineTransform(rotationAngle: .random())
                self.bLabel.transform = CGAffineTransform(rotationAngle: .random())
                self.dLabel.transform = CGAffineTransform(rotationAngle: .random())
                self.secondALabel.transform = CGAffineTransform(rotationAngle: .random())
            }
        
        }
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: animationBlock, completion: nil)
        
    }
    
    private func gatherLetters() {
        
        let animationBlock = {
            
            // Fades in Lambda logo
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.imageView.alpha = 1.0
            }
            
            // Changes color of letters back to normal
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.lLabel.backgroundColor = .white
                self.lLabel.textColor = .black
                
                self.firstALabel.backgroundColor = .white
                self.firstALabel.textColor = .black
                
                self.mLabel.backgroundColor = .white
                self.mLabel.textColor = .black
                
                self.bLabel.backgroundColor = .white
                self.bLabel.textColor = .black
                
                self.dLabel.backgroundColor = .white
                self.dLabel.textColor = .black
                
                self.secondALabel.backgroundColor = .white
                self.secondALabel.textColor = .black
            }
            
            // Changes rotation and position of letters back to normal
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.lLabel.transform = .identity
                self.firstALabel.transform = .identity
                self.mLabel.transform = .identity
                self.bLabel.transform = .identity
                self.dLabel.transform = .identity
                self.secondALabel.transform = .identity
            }
            
        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animationBlock, completion: nil)
        
    }
    
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat.random(in: 1...300)
    }
}

