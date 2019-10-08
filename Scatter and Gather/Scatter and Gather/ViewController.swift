//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Isaac Lyons on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered = false
    let labelText: String = "Lambda"
    var labels: [UILabel] = []
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        resetLabels()
    }
    
    private func configureViews() {
        let imageView = UIImageView(image: UIImage(named: "lambda_logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //imageView.layer.borderWidth = 2
        //imageView.layer.cornerRadius = 12
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        self.imageView = imageView
        
        labels = []
        
        for letter in labelText {
            print(letter)
            let label = UILabel()
            label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            
            label.text = "\(letter)"
            label.textAlignment = .center
            label.font = UIFont.monospacedSystemFont(ofSize: 48, weight: .medium)
            
            labels.append(label)
        }
    }
    
    private func scatter() {
        UIView.animate(withDuration: 2) {
            self.imageView.alpha = 0
            
            for label in self.labels {
                let screenWidth = Int(UIScreen.main.bounds.width)
                let xPosition = Int.random(in: 0...screenWidth)
                let screenHeight = Int(UIScreen.main.bounds.height)
                let yPosition = Int.random(in: 0...screenHeight)
                label.center = CGPoint(x: xPosition, y: yPosition)
                
                label.backgroundColor = self.randomColor()
                label.textColor = self.randomColor()
                label.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            }
        }
    }
    
    private func gather() {
        UIView.animate(withDuration: 2) {
            self.imageView.alpha = 100
            self.resetLabels()
        }
    }
    
    private func resetLabels() {
        let totalLetters = labelText.count
        var i: CGFloat = 1
        for label in labels {
             let xPosition = UIScreen.main.bounds.width / CGFloat(totalLetters + 1) * i
            label.center = CGPoint(x: xPosition, y: 200)
            
            label.backgroundColor = UIColor(white: 1, alpha: 0)
            label.textColor = .black
            label.transform = CGAffineTransform(rotationAngle: 0)
            
            i += 1
        }
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    private func randomAngle() -> CGFloat {
        return CGFloat.random(in: 0...CGFloat.pi * 2)
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        if isScattered {
            scatter()
        } else {
            gather()
        }
    }
    
}

