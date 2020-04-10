//
//  ToggleViewController.swift
//  ScatterAndGather
//
//  Created by Bree Jeune on 4/10/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit
import SwiftUI

class ToggleViewController: UIViewController {
    
    var isScattered: Bool = true {
        didSet {
            scatterAndGatherLetters()
        }
    }
    
    
  let lambdaLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let lLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let aLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "a"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let mLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "m"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let bLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "b"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let dLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "d"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let a2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "a"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()

    var labelArray = [UILabel]()
    var positions = [CGPoint]()



    override func viewDidLoad() {
        super.viewDidLoad()
        lambdaLogoAnimation()
        lambdaLabelAnimation()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(buttonIsToggled))
        labelArray.append(lLabel)
        labelArray.append(aLabel)
        labelArray.append(mLabel)
        labelArray.append(bLabel)
        labelArray.append(dLabel)
        labelArray.append(a2Label)
    }

    @objc private func buttonIsToggled() {
        isScattered.toggle()
    }

    private func scatterAndGatherLetters() {
        if isScattered {
            UIView.animate(withDuration: 3.0) {
                self.lambdaLogo.alpha = 1
                for (index, label) in self.labelArray.enumerated() {
                    label.transform = .identity
                    label.backgroundColor = .clear
                    label.textColor = .black
                    label.center = self.positions[index]
                }
            }
        } else {
            UIView.animate(withDuration: 3.0) {
                self.lambdaLogo.alpha = 0
                for (index, label) in self.labelArray.enumerated() {
                    self.positions.insert(label.center, at: index)
                    label.center = CGPoint(x: CGFloat.random(in: 0 ... self.view.bounds.size.width), y: CGFloat.random(in: 0 ... self.view.bounds.size.height))
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0 ... 8))
                    label.backgroundColor = UIColor(red: (CGFloat.random(in: 0 ... 255) / 255), green: (CGFloat.random(in: 0 ... 255)) / 255, blue: (CGFloat.random(in: 0 ... 255) / 255), alpha: 1)
                    label.textColor = UIColor(red: (CGFloat.random(in: 0 ... 255) / 255), green: (CGFloat.random(in: 0 ... 255)) / 255, blue: (CGFloat.random(in: 0 ... 255) / 255), alpha: 1)
                }
            }
        }
    }

    /// Constraints needed:   X,    Y,     Width,     Height
    private func lambdaLogoAnimation() {
        view.addSubview(lambdaLogo)
        lambdaLogo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        lambdaLogo.heightAnchor.constraint(equalTo: lambdaLogo.widthAnchor, multiplier: 0.5).isActive = true
        lambdaLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        lambdaLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func lambdaLabelAnimation() {
        view.addSubview(lLabel)
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6).isActive = true
        lLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        lLabel.heightAnchor.constraint(equalTo: lLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(aLabel)
        aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 10).isActive = true
        aLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        aLabel.heightAnchor.constraint(equalTo: aLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(mLabel)
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 10).isActive = true
                mLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
                mLabel.heightAnchor.constraint(equalTo: mLabel.widthAnchor, multiplier: 1).isActive = true
                
                view.addSubview(bLabel)
                bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 10).isActive = true
                bLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
                bLabel.heightAnchor.constraint(equalTo: bLabel.widthAnchor, multiplier: 1).isActive = true
                
                view.addSubview(dLabel)
                dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 10).isActive = true
                dLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
                dLabel.heightAnchor.constraint(equalTo: dLabel.widthAnchor, multiplier: 1).isActive = true
                
                view.addSubview(a2Label)
                a2Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 10).isActive = true
                a2Label.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
                a2Label.heightAnchor.constraint(equalTo: a2Label.widthAnchor, multiplier: 1).isActive = true
            }
        }
        

