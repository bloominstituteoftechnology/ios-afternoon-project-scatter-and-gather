//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by David Williams on 4/12/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isToggled: Bool = false
    var labelL: UILabel!
    var labelA1: UILabel!
    var labelM: UILabel!
    var labelB: UILabel!
    var labelD: UILabel!
    var labelA2: UILabel!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        // Do any additional setup after loading the view.
    }

    private func configureLabels() {
        labelL = UILabel(frame: CGRect(x: 10, y: 155, width: 50, height: 50))
        labelL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelL)
        
        labelL.text = "L"
        labelL.textAlignment = .center
        labelL.tintColor = .black
        labelL.font = UIFont.systemFont(ofSize: 86)
        
        labelA1 = UILabel(frame: CGRect(x: 55, y: 155, width: 50, height: 50))
        labelA1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelA1)
        
        labelA1.text = "a"
        labelA1.textAlignment = .center
        labelA1.tintColor = .black
        labelA1.font = UIFont.systemFont(ofSize: 86)
        
        labelM = UILabel(frame: CGRect(x: 100, y: 155, width: 50, height: 50))
        labelM.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelM)
        
        labelM.text = "m"
        labelM.textAlignment = .center
        labelM.tintColor = .black
        labelM.font = UIFont.systemFont(ofSize: 86)
        
        labelB = UILabel(frame: CGRect(x: 145, y: 155, width: 50, height: 50))
        labelB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelB)
        
        labelB.text = "b"
        labelB.textAlignment = .center
        labelB.tintColor = .black
        labelB.font = UIFont.systemFont(ofSize: 86)
        
        labelD = UILabel(frame: CGRect(x: 190, y: 155, width: 50, height: 50))
        labelD.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelD)
       
        labelD.text = "d"
        labelD.textAlignment = .center
        labelD.tintColor = .black
        labelD.font = UIFont.systemFont(ofSize: 86)
        
        labelA2 = UILabel(frame: CGRect(x: 235, y: 155, width: 50, height: 50))
        labelA2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelA2)
        
        labelA2.text = "a"
        labelA2.textAlignment = .center
        labelA2.tintColor = .black
        labelA2.font = UIFont.systemFont(ofSize: 86)
        
        let stackview = UIStackView()
               stackview.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(stackview)
        
        stackview.axis = .horizontal
               stackview.distribution = .equalSpacing
        
        stackview.addArrangedSubview(labelL)
        stackview.addArrangedSubview(labelA1)
        stackview.addArrangedSubview(labelM)
        stackview.addArrangedSubview(labelD)
        stackview.addArrangedSubview(labelB)
        stackview.addArrangedSubview(labelA2)
        
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.image = UIImage(named: "lambda_logo")
        self.imageView = imageView
        
        imageView.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
    }

    @IBAction func toggleButtpnPressed(_ sender: Any) {
        isToggled.toggle()
        if isToggled {
        imageView.isHidden = true
        } else {
            imageView.isHidden = false
        }
        
        let animLabelLBlock = {
            
            self.labelL.backgroundColor = .blue
            self.labelL.textColor = .cyan
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.labelL.transform = CGAffineTransform(rotationAngle: .pi/16)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.labelL.transform = CGAffineTransform(rotationAngle: -.pi / 16)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.80) {
                self.labelL.center = CGPoint(
                    x: self.view.bounds.size.width + self.labelL.bounds.size.width,
                    y: self.view.center.y
                )
            }
        }
        
        let animLabelA1Block = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.labelA1.transform = CGAffineTransform(rotationAngle: .pi/16)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.labelA1.transform = CGAffineTransform(rotationAngle: -.pi / 16)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.80) {
                self.labelA1.center = CGPoint(
                    x: self.view.bounds.size.width + self.labelA1.bounds.size.width,
                    y: self.view.center.y
                )
            }
        }
        
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelLBlock, completion: nil)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animLabelA1Block, completion: nil)
           
    }
}

