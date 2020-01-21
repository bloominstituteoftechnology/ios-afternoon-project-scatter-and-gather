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
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
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
            UIView.animate(withDuration: 2.0) {
                for view in self.hStack.arrangedSubviews {
                    if let label = view as? UILabel {
                        label.transform = .identity
                        label.textColor = .systemRed
                    }
                }
            }
        } else {
            isScattered = true
            UIView.animate(withDuration: 2.0) {
                for view in self.hStack.arrangedSubviews {
                    if let label = view as? UILabel {
                        self.randomColor(label)
                        //let minX = self.view.frame.minX
                        //let maxX = self.view.frame.maxX
                        let randomX = CGFloat.random(in: -180..<180)
                        
                        //let minY = self.view.frame.minY
                        //let maxY = self.view.frame.maxY
                        let randomY = CGFloat.random(in: -20..<400)
                        
                        label.transform = CGAffineTransform(translationX: randomX, y: randomY)
                    }
                }
            }
        }
    }
    
    private func randomColor(_ label: UILabel) {
        let randomColorProperty = CGFloat.random(in: 0.1...1.0)
        label.textColor = UIColor(hue: randomColorProperty, saturation: randomColorProperty, brightness: randomColorProperty, alpha: randomColorProperty)
    }
    
    private func createLabel(_ text: String) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 24)
        label.textColor = .systemRed
        label.text = text
        view.addSubview(label)
        hStack.addArrangedSubview(label)
    }
}
