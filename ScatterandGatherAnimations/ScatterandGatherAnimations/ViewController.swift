//
//  ViewController.swift
//  ScatterandGatherAnimations
//
//  Created by Ufuk Türközü on 21.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    var labels: [UILabel]  = []
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
        print(isScattered)
        animation()
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private func animation() {
        
        if isScattered == true {
            UIView.animate(withDuration: 1.5, animations: {
                self.imageView.alpha = 0.0
                for label in self.labels {
                    label.transform = self.randomTranslation(for: label)
                    label.layer.backgroundColor = self.randomColor().cgColor
                }
            })
        } else {
            UIView.animate(withDuration: 1.5, animations: {
                self.imageView.alpha = 1.0
                for label in self.labels {
                    label.transform = .identity
                    label.layer.backgroundColor = UIColor.white.cgColor
                }
            })
        }
    }
    
    func randomTranslation(for label: UILabel) -> CGAffineTransform {
        let x = (CGFloat.random(in: 0...100))
        let y = (CGFloat.random(in: 0...660))
        return CGAffineTransform(translationX: x, y: y).rotated(by: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
    }
    
    func setUpView() {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        self.imageView = imageView
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.5)
        ])
        
        let lLabel = UILabel()
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lLabel)
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont(name: "Rockwell", size: 60)
        //lLabel.font = UIFont.systemFont(ofSize: 60)
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        aLabel.text = "A"
        aLabel.textAlignment = .center
        aLabel.font = UIFont(name: "Rockwell", size: 60)
        aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 12).isActive = true
        
        let mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont(name: "Rockwell", size: 60)
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 12).isActive = true
        
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bLabel)
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont(name: "Rockwell", size: 60)
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 12).isActive = true
        
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dLabel)
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont(name: "Rockwell", size: 60)
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 12).isActive = true
        
        let aaLabel = UILabel()
        aaLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aaLabel)
        aaLabel.text = "A"
        aaLabel.textAlignment = .center
        aaLabel.font = UIFont(name: "Rockwell", size: 60)
        aaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        aaLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        
        labels.append(lLabel)
        labels.append(aLabel)
        labels.append(mLabel)
        labels.append(bLabel)
        labels.append(dLabel)
        labels.append(aaLabel)
        
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(stackView)
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
//        ])
        
    }
    
}

