//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Andrew Ruiz on 9/10/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

// Testing Github

class ViewController: UIViewController {
    
    var isScattered : Bool = false
    
    var imageView: UIImageView!
    
    var letter1: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        
        print(self.letter1.frame.origin.x)

    }
    
    
    func setUpSubViews() {
        
        // imageView
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.image = UIImage(named: "lambda_logo")
        
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
        
        self.imageView = imageView
        
        
        // Letters
        let letter1 = UILabel()
        letter1.translatesAutoresizingMaskIntoConstraints = false
        letter1.text = "L"
        view.addSubview(letter1)
        
        let letter1TopConstraint = NSLayoutConstraint(item: letter1,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: view.safeAreaLayoutGuide,
                                                         attribute: .top,
                                                         multiplier: 1,
                                                         constant: 20)
        
        let letter1LeftConstraint = NSLayoutConstraint(item: letter1,
                                                      attribute: .left,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .left,
                                                      multiplier: 1,
                                                      constant: 20)
        
        NSLayoutConstraint.activate([letter1TopConstraint, letter1LeftConstraint])
        
        self.letter1 = letter1

    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == true {
            scatterAnimation()
            isScattered = false
        } else {
            gatherAnimation()
            isScattered = true
        }
        
    }
    
    func scatterAnimation() {
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 0
            //self.letter1.frame.origin = CGPoint(x: .random(in: 50...400), y: .random(in: 100...900))
            self.letter1.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
            self.letter1.transform = CGAffineTransform(rotationAngle: .random(in: 0...1)).translatedBy(x: .random(in: 50...400), y: .random(in: 100...900))
    }
    }
    
    func gatherAnimation() {
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 1
            self.letter1.transform = .identity
            //self.letter1.frame.origin = CGPoint(x: 20, y: 20)

        }
    }
}

