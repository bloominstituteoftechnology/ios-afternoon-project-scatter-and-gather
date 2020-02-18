//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by scott harris on 2/18/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var isScattered: Bool = false
    var lambdaImageView: UIImageView!
    var labels: [UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        runAnimations()
        
    }
    
    
    // MARK: - Private
    
    private func setupViews() {
        configureLambdaImage()
        configureLetterLabels()
        
    }
    
    private func configureLambdaImage() {
        lambdaImageView = UIImageView(image: UIImage(named: "lambda_logo"))
        lambdaImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lambdaImageView)
        
        lambdaImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 175).isActive = true
        lambdaImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        lambdaImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        lambdaImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    private func configureLetterLabels() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        var labels: [UILabel] = []
        let string = "Lambda"
        for char in string {
            let letter = String(char)
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
            label.text = letter
            labels.append(label)
            view.addSubview(label)
            stackView.addArrangedSubview(label)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        
        self.labels = labels
        
    }
    
    private func runAnimations() {
        if !isScattered {
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.lambdaImageView.alpha = 0.001
                    
                    let minX = self.view.safeAreaInsets.left
                    let minY = self.view.safeAreaInsets.top
                    let maxX = self.view.frame.width - self.view.safeAreaInsets.right
                    let maxY = self.view.frame.height - self.view.safeAreaInsets.bottom - self.view.safeAreaInsets.top

                    for label in self.labels {
                        let randomX = CGFloat.random(in: minX...maxX)
                        let randomY = CGFloat.random(in: minY...maxY)
                        label.transform = CGAffineTransform(translationX: randomX - label.center.x - label.frame.size.width, y: randomY).rotated(by: CGFloat.pi / CGFloat.random(in: 1.0...4.0))
                    }
                    
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1) {
                    for label in self.labels {
                        let randomGreen = CGFloat.random(in: 0...1)
                        let randomRed = CGFloat.random(in: 0...1)
                        let randomBlue = CGFloat.random(in: 0...1)
                        let randomAlpha = CGFloat.random(in: 0.8...1)
                        
                        let randomBackgroundGreen = CGFloat.random(in: 0...1)
                        let randomBackgroundRed = CGFloat.random(in: 0...1)
                        let randomBackgroundBlue = CGFloat.random(in: 0...1)
                        let randomBackgroundAlpha = CGFloat.random(in: 0.3...0.5)
                        label.textColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: randomAlpha)
                        label.layer.backgroundColor = UIColor(red: randomBackgroundRed, green: randomBackgroundGreen, blue: randomBackgroundBlue, alpha: randomBackgroundAlpha).cgColor
                        
                        
                    }
                    
                }
                
                
            }) { (_) in
                self.isScattered.toggle()
            }
            
        } else {
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.lambdaImageView.alpha = 1
                    for label in self.labels {
                        label.transform = .identity
                    }
                    
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1) {
                    for label in self.labels {
                        label.textColor = .black
                        label.layer.backgroundColor = UIColor.clear.cgColor
  
                    }
                    
                }
                
                
            }) { (_) in
                self.isScattered.toggle()
            }
            
        }
        
        
    }
    
}

