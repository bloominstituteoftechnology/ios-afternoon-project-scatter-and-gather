//
//  ViewController.swift
//  ScatterGather
//
//  Created by Kenneth Jones on 5/22/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered = false
    var capLLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var endALabel = UILabel()
    var imageView = UIImageView()
    var stackView = UIStackView()
    
    var centerPoints: [CGPoint] = []
    
    var capLCenter = CGPoint()
    var aCenter = CGPoint()
    var mCenter = CGPoint()
    var bCenter = CGPoint()
    var dCenter = CGPoint()
    var endACenter = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        capLCenter = capLLabel.convert(CGPoint(x: capLLabel.bounds.size.width/2, y: capLLabel.bounds.size.height/2), to: stackView)
        aCenter = aLabel.convert(CGPoint(x: aLabel.bounds.size.width/2, y: aLabel.bounds.size.height/2), to: stackView)
        mCenter = mLabel.convert(CGPoint(x: mLabel.bounds.size.width/2, y: mLabel.bounds.size.height/2), to: stackView)
        bCenter = bLabel.convert(CGPoint(x: bLabel.bounds.size.width/2, y: bLabel.bounds.size.height/2), to: stackView)
        dCenter = dLabel.convert(CGPoint(x: dLabel.bounds.size.width/2, y: dLabel.bounds.size.height/2), to: stackView)
        endACenter = endALabel.convert(CGPoint(x: endALabel.bounds.size.width/2, y: endALabel.bounds.size.height/2), to: stackView)
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if !isScattered {
            UIView.animate(withDuration: 3.0) {
                self.imageView.alpha = 0

                self.capLLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...5) * .pi / CGFloat.random(in: 1...6))
                self.capLLabel.center = CGPoint(x: CGFloat.random(in: 0...self.view.bounds.size.width-100), y: CGFloat.random(in: 0...self.view.bounds.size.height-100))
                self.capLLabel.layer.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
                self.capLLabel.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))

                self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...5) * .pi / CGFloat.random(in: 1...6))
                self.aLabel.center = CGPoint(x: CGFloat.random(in: 0...self.view.bounds.size.width-100), y: CGFloat.random(in: 0...self.view.bounds.size.height-100))
                self.aLabel.layer.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
                self.aLabel.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))

                self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...5) * .pi / CGFloat.random(in: 1...6))
                self.mLabel.center = CGPoint(x: CGFloat.random(in: 0...self.view.bounds.size.width-100), y: CGFloat.random(in: 0...self.view.bounds.size.height-100))
                self.mLabel.layer.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
                self.mLabel.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))

                self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...5) * .pi / CGFloat.random(in: 1...6))
                self.bLabel.center = CGPoint(x: CGFloat.random(in: 0...self.view.bounds.size.width-100), y: CGFloat.random(in: 0...self.view.bounds.size.height-100))
                self.bLabel.layer.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
                self.bLabel.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))

                self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...5) * .pi / CGFloat.random(in: 1...6))
                self.dLabel.center = CGPoint(x: CGFloat.random(in: 0...self.view.bounds.size.width-100), y: CGFloat.random(in: 0...self.view.bounds.size.height-100))
                self.dLabel.layer.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
                self.dLabel.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))

                self.endALabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...5) * .pi / CGFloat.random(in: 1...6))
                self.endALabel.center = CGPoint(x: CGFloat.random(in: 0...self.view.bounds.size.width-100), y: CGFloat.random(in: 0...self.view.bounds.size.height-100))
                self.endALabel.layer.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
                self.endALabel.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
            }
            isScattered = !isScattered
        } else {
            UIView.animate(withDuration: 3.0) {
                self.imageView.alpha = 1.0

                self.capLLabel.transform = .identity
                self.aLabel.transform = .identity
                self.mLabel.transform = .identity
                self.bLabel.transform = .identity
                self.dLabel.transform = .identity
                self.endALabel.transform = .identity

                self.capLLabel.center = self.capLCenter
                self.aLabel.center = self.aCenter
                self.mLabel.center = self.mCenter
                self.bLabel.center = self.bCenter
                self.dLabel.center = self.dCenter
                self.endALabel.center = self.endACenter

                self.capLLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                self.aLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                self.mLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                self.bLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                self.dLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                self.endALabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)

                self.capLLabel.textColor = .black
                self.aLabel.textColor = .black
                self.mLabel.textColor = .black
                self.bLabel.textColor = .black
                self.dLabel.textColor = .black
                self.endALabel.textColor = .black
            }
            isScattered = !isScattered
        }
    }
    
    private func configureSubviews() {
        capLLabel.translatesAutoresizingMaskIntoConstraints = false
        capLLabel.text = "L"
        capLLabel.textAlignment = .center
        capLLabel.font = UIFont.systemFont(ofSize: 33)
        
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "a"
        aLabel.textAlignment = .center
        aLabel.font = UIFont.systemFont(ofSize: 33)
        
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "m"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 33)
        
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "b"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 33)
        
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "d"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 33)
        
        endALabel.translatesAutoresizingMaskIntoConstraints = false
        endALabel.text = "a"
        endALabel.textAlignment = .center
        endALabel.font = UIFont.systemFont(ofSize: 33)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(capLLabel)
        stackView.addArrangedSubview(aLabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(endALabel)
        
        self.stackView = stackView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "lambda_logo")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            imageView.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
