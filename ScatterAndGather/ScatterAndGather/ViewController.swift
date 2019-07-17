//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Kat Milton on 7/17/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
    var imageView: UIImageView!
    let colors: [UIColor] = [.yellow, .blue, .lightGray, .magenta, .purple, .cyan, .orange, .darkGray, .green, .red]
    var labels: [UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        configureImage()
        
        // Do any additional setup after loading the view.
    }
    
    func configureLabels() {
        // Create labels
        let lLabel = UILabel()
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 56)
        labels.append(lLabel)
        
        let a1Label = UILabel()
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        a1Label.text = "a"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 56)
        labels.append(a1Label)
        
        let mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "m"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 56)
        labels.append(mLabel)
        
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "b"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 56)
        labels.append(bLabel)
        
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "d"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 56)
        labels.append(dLabel)
        
        let a2Label = UILabel()
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        a2Label.text = "a"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 56)
        labels.append(a2Label)
        
        // Stack view Setup
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add labels to stack view
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(a1Label)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(a2Label)
        
        // Stackview constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }

    func configureImage() {
        imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.image = UIImage(named: "lambda_logo")
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        

    }
    
    // MARK: - IBAction
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            gather()
        } else {
            scatter()
        }
        
        isScattered = !isScattered
    }
    

    func scatter() {
        for i in labels {
            animate(label: i)
        }
    }
    
    func gather() {
        for i in labels {
            reset(label: i)
        }
    }
    
    // Animate logo and letters
    func animate(label: UILabel) {
        // Letter background colors
        
        UILabel.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            label.layer.backgroundColor = UIColor.random(from: self.colors)?.cgColor
            label.transform = CGAffineTransform(rotationAngle: .random(in: 0...40)).concatenating(CGAffineTransform(translationX: CGFloat.random(in: 0...100), y: CGFloat.random(in: -10...400)))
            label.textColor = UIColor.random(from: self.colors)
        }, completion: nil)
        
        UIImageView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            self.imageView.alpha = 0
        }, completion: nil)
    }
        

    // animation to return to original state.
    func reset(label: UILabel) {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            self.imageView.alpha = 1
                        label.transform = .identity
                        label.textColor = UIColor.black
                        label.layer.backgroundColor = UIColor.clear.cgColor
        }, completion: nil)

    
}
}

// Extension to randomize colors
extension UIColor {
    static func random(from colors: [UIColor]) -> UIColor? {
        return colors.randomElement()
    }
}
