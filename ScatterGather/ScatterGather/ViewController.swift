//
//  ViewController.swift
//  ScatterGather
//
//  Created by Jorge Alvarez on 1/21/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var lLabel: UILabel!
    var aLabel: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!
    
    var isScattered: Bool = false
    
    var stackView: UIStackView!
    
    var labelArray: [UILabel] = []
    
    var logoImageView: UIImageView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureImage()
        configureLabels()
    }

    // MARK: - Views
    
    func configureNavBar() {
        let toggleButtonItem = UIBarButtonItem(title: "Toggle", style: .done, target: self, action: #selector(toggleButtonPressed))
        navigationItem.setRightBarButton(toggleButtonItem, animated: true)
        title = "Scatter & Gather"
    }
    
    func configureImage() {
        // ImageView
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "lambda_logo")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // Constraints
        logoImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func configureLabels() {
        
        // Labels
        lLabel = UILabel(); lLabel.text = "L"
        aLabel = UILabel(); aLabel.text = "A"
        mLabel = UILabel(); mLabel.text = "M"
        bLabel = UILabel(); bLabel.text = "B"
        dLabel = UILabel(); dLabel.text = "D"
        a2Label = UILabel(); a2Label.text = "A"
        
        labelArray = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        // StackView
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        for label in labelArray {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 60)
            view.addSubview(label)
            stackView.addArrangedSubview(label)
        }
    }
    
    // MARK: - Actions

    @objc func toggleButtonPressed() {
        print("TOGGLE, isScattered is = \(isScattered)")
        isScattered.toggle()
        if isScattered {
            print("isScattered now = \(isScattered)")
            for label in labelArray {
                label.backgroundColor = randomColor()
                label.textColor = randomColor()
                // Fades out logo image
                UIView.animate(withDuration: 2) {
                    self.logoImageView.alpha = 0
                }
                
                // Rotates
                UIView.animate(withDuration: 1.0, animations: { label.transform = CGAffineTransform(rotationAngle: CGFloat.pi) }, completion: nil)
                
                UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                        //label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: -8...8)) // 8
                        //label.center = self.randomPoint()
                        let point = self.randomPoint()
                        label.transform = CGAffineTransform(translationX: point.x, y: point.y).rotated(by: CGFloat.pi / CGFloat.random(in: -8...8))
                    }
                
                }, completion: nil)
                
                }
        } else {
            print("isScattered now = \(isScattered)")
            for label in labelArray {
                label.backgroundColor = .white
                label.textColor = .black
                //let lastPoint: CGPoint = CGPoint(x: label.center.x, y: label.center.y)
                
                // Fades in logo image
                UIView.animate(withDuration: 2) {
                    self.logoImageView.alpha = 1
                }
                
                // Rotates back?
                //UIView.animate(withDuration: 1.0) { label.transform = .identity }
                
                UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                        label.transform = .identity
                        
                        //label.center = self.randomPoint() // FIX
                        //label.transform = CGAffineTransform(translationX: startingPoint.x, y: startingPoint.y)
                    }
                
                }, completion: nil)
            }
        }
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    func randomPoint() -> CGPoint {
        let w = Int(view.frame.width) - 200
        let h = Int(view.frame.height) - 200
        print("W: \(w) H: \(h)")
        let point = CGPoint(x: Int.random(in: 1...w), y: Int.random(in: 1...h)) //Int.random(in: 1...500)
        print(point)
        return point
    }
}


