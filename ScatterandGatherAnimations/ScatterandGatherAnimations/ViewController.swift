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
    
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0.0...1.0)
    let blue = CGFloat.random(in: 0.0...1.0)
    
    let randomColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
        print(isScattered)
       
    }
    
    func setUpView() {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        
//        if isScattered == true {
//            UIView.animate(withDuration: 1.5, animations: {
//                imageView.alpha = 0.0
//            })
//        }
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        lLabel.font = UIFont.systemFont(ofSize: 60)
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        aLabel.text = "A"
        aLabel.textAlignment = .center
        aLabel.font = UIFont.systemFont(ofSize: 60)
        aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 20).isActive = true
        
        let mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 60)
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 20).isActive = true
        
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bLabel)
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 60)
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 20).isActive = true
    
        let dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dLabel)
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 60)
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 20).isActive = true
        
        let aaLabel = UILabel()
        aaLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aaLabel)
        aaLabel.text = "A"
        aaLabel.textAlignment = .center
        aaLabel.font = UIFont.systemFont(ofSize: 60)
        aaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        aaLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
    }
    
    func animation() {
        UIView.animate(withDuration: 4.0) {

            self.imageView.alpha = 0.0
            
        }
    }
    
}

