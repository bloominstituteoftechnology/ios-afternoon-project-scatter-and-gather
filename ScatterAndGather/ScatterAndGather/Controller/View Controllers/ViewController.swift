//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Kenny on 1/21/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    private var isScattered = false
    private let hStack = UIStackView()
    private var imageView = UIImageView()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        //configure imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView = UIImageView(frame: CGRect(x: 25, y: self.view.center.y, width: self.view.bounds.width - 50, height: 100))
        imageView.image = UIImage(named: "logo")
        view.addSubview(imageView)
        
        //configure horizontal stack
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.alignment = .leading
        hStack.distribution = .fill
        hStack.spacing = 4
        self.view.addSubview(hStack)
        
        hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        hStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        //add labels to stack
        createLabel("L")
        createLabel("A")
        createLabel("M")
        createLabel("B")
        createLabel("D")
        createLabel("A")
    }
    
    @IBAction func toggleButtonWasPressed(_ sender: Any) {
        scatter()
    }
    
    @objc private func scatter() {
        
        if isScattered {
            isScattered = false
            //animate while reverting to original properties
            UIView.animate(withDuration: 2.0) {
                for view in self.hStack.arrangedSubviews {
                    if let label = view as? UILabel {
                        //hide label in order to animate it in its new position
                        label.alpha = 0
                        self.hStack.addArrangedSubview(label) //since arrangedSubviews is an array, order is guaranteed so elements will be placed back in order (still spelling LAMBDA)
                        label.alpha = 1
                        self.imageView.alpha = 1
                        label.textColor = .systemRed
                    }
                }
            }
        } else {
            isScattered = true
            //change color and position
            UIView.animate(withDuration: 2.0) {
                for view in self.hStack.arrangedSubviews {
                    if let label = view as? UILabel {
                        self.randomColor(label)
                        
                        let maxX = self.view.bounds.maxX - label.bounds.width - label.bounds.maxX
                        let randomX = CGFloat.random(in: 0..<maxX)
                        
                        let maxY = self.view.bounds.maxY - label.bounds.maxY - label.bounds.height - 40 //40 is topAnchor constraint constant
                        let randomY = CGFloat.random(in: 0..<maxY)
                        
                        label.layer.position = CGPoint(x: randomX, y: randomY)
                        self.imageView.alpha = 0
                    }
                }
            }
        }
    }
    
    private func randomColor(_ label: UILabel) {
        let randomColorProperty = CGFloat.random(in: 0.1...1.0)
        label.textColor = UIColor(hue: randomColorProperty, saturation: randomColorProperty, brightness: randomColorProperty, alpha: 1)
    }
    
    private func createLabel(_ text: String) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: "Times", size: 72)
        label.textColor = .systemRed
        label.text = text
        
        view.addSubview(label)
        hStack.addArrangedSubview(label)
    }
}
