//
//  ViewController.swift
//  ScatterandGather
//
//  Created by Lydia Zhang on 3/17/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var logo: UIImage = UIImage(named: "lambda_logo")!
    var lambdaLogoImageView: UIImageView!
    let labelL = UILabel()
    let labelA = UILabel()
    let labelM = UILabel()
    let labelB = UILabel()
    let labelD = UILabel()
    let labelA2 = UILabel()
    
    var isScattered: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewLabel()
        initialViewimage()
    }
    
    func initialViewLabel() {
        //MARK: - Button
        let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggle))
        navigationItem.rightBarButtonItem = toggleButton
        
        
        //MARK: - Labels
        view.addSubview(labelL)
        view.addSubview(labelA)
        view.addSubview(labelM)
        view.addSubview(labelB)
        view.addSubview(labelD)
        view.addSubview(labelA2)
        
        
        labelL.translatesAutoresizingMaskIntoConstraints = false
        labelL.text = "L"
        labelL.textAlignment = .center
        labelL.font = UIFont.systemFont(ofSize: 50)
        
        
        labelA2.translatesAutoresizingMaskIntoConstraints = false
        labelA2.text = "A"
        labelA2.textAlignment = .center
        labelA2.font = UIFont.systemFont(ofSize: 50)
        
        
        labelA.translatesAutoresizingMaskIntoConstraints = false
        labelA.text = "A"
        labelA.textAlignment = .center
        labelA.font = UIFont.systemFont(ofSize: 50)
        
        labelM.translatesAutoresizingMaskIntoConstraints = false
        labelM.text = "M"
        labelM.textAlignment = .center
        labelM.font = UIFont.systemFont(ofSize: 50)
        
        labelB.translatesAutoresizingMaskIntoConstraints = false
        labelB.text = "B"
        labelB.textAlignment = .center
        labelB.font = UIFont.systemFont(ofSize: 50)
        
        labelD.translatesAutoresizingMaskIntoConstraints = false
        labelD.text = "D"
        labelD.textAlignment = .center
        labelD.font = UIFont.systemFont(ofSize: 50)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(labelL)
        stackView.addArrangedSubview(labelA)
        stackView.addArrangedSubview(labelM)
        stackView.addArrangedSubview(labelB)
        stackView.addArrangedSubview(labelD)
        stackView.addArrangedSubview(labelA2)
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    func initialViewimage() {
        lambdaLogoImageView = UIImageView(image: logo)
        lambdaLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        lambdaLogoImageView.contentMode = .scaleAspectFit
        view.addSubview(lambdaLogoImageView)
        lambdaLogoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        .isActive = true
        lambdaLogoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0)
        .isActive = true
        lambdaLogoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        .isActive = true
        lambdaLogoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        .isActive = true
    }
    @objc func toggle() {
        isScattered.toggle()
        let labels = [labelL,labelA,labelM,labelB,labelD,labelA2]
        if isScattered == true {
            
            for label in labels {
                scatter(label: label, duration: 2.0)
            }
        } else {
            for label in labels {
                gather(label: label, duration: 2.0)
            }
        }
    }

    func gather(label: UILabel, duration: Double) {
        UIView.animate(withDuration: duration) {
            label.transform = CGAffineTransform(rotationAngle: 0)
            label.textColor = .black
            label.layer.backgroundColor = .none
            label.alpha = 1
            self.lambdaLogoImageView.alpha = 1
            self.initialViewLabel()
        }
    }

    func scatter(label: UILabel, duration: Double){
        let randomH = Int.random(in: 0...Int(view.bounds.width - label.frame.width))
        let randomV = Int.random(in: 0...Int(view.bounds.width - label.frame.height))
        label.center = CGPoint(x: randomH, y: randomV)
        
        let labelTextColor = UIColor(displayP3Red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: CGFloat(Double.random(in: 0.8...1.0)))
        let labelBackgroundColor = CGColor(srgbRed: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: CGFloat(Double.random(in: 0.2...1.0)))
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.125, animations: {
                self.lambdaLogoImageView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.125, relativeDuration: 0.25, animations: {
                label.center = CGPoint(x: randomH, y: randomV)
                label.textColor = labelTextColor
                label.layer.backgroundColor = labelBackgroundColor
                label.transform3D = CATransform3DMakeRotation(CGFloat(Int.random(in: 0...360)),CGFloat(Int.random(in: 0...360)),CGFloat(Int.random(in: 0...360)),CGFloat(Int.random(in: 0...360)))
            })
        }, completion: nil)
    }
}

