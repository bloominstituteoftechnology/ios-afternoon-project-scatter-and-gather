//
//  ViewController.swift
//  ScatterGatherApp
//
//  Created by Mark Poggi on 4/14/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    var firstALabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var lastALabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLambdaText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alignLambdaText()
        
        
    }
    
    private func alignLambdaText() {
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        
        firstALabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        firstALabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
        firstALabel.widthAnchor.constraint(equalTo: firstALabel.heightAnchor).isActive = true
        
        mLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: firstALabel.trailingAnchor, constant: 10).isActive = true
        mLabel.widthAnchor.constraint(equalTo: mLabel.heightAnchor).isActive = true
        
        bLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 10).isActive = true
        bLabel.widthAnchor.constraint(equalTo: bLabel.heightAnchor).isActive = true
        
        dLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 10).isActive = true
        dLabel.widthAnchor.constraint(equalTo: dLabel.heightAnchor).isActive = true
        
        lastALabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
        lastALabel.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 10).isActive = true
        lastALabel.widthAnchor.constraint(equalTo: lastALabel.heightAnchor).isActive = true
        
    }
    
    
    
    private func configureLambdaText() {
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 0.1
        label.layer.cornerRadius = 12
        label.text = "L"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48)
        
        firstALabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        firstALabel.translatesAutoresizingMaskIntoConstraints = false
        firstALabel.layer.borderWidth = 0.1
        firstALabel.layer.cornerRadius = 12
        firstALabel.text = "A"
        firstALabel.textAlignment = .center
        firstALabel.font = UIFont.systemFont(ofSize: 48)
        
        mLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.layer.borderWidth = 0.1
        mLabel.layer.cornerRadius = 12
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 48)
        
        bLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.layer.borderWidth = 0.1
        bLabel.layer.cornerRadius = 12
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 48)
        
        dLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.layer.borderWidth = 0.1
        dLabel.layer.cornerRadius = 12
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 48)
        
        lastALabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        lastALabel.translatesAutoresizingMaskIntoConstraints = false
        lastALabel.layer.borderWidth = 0.1
        lastALabel.layer.cornerRadius = 12
        lastALabel.text = "A"
        lastALabel.textAlignment = .center
        lastALabel.font = UIFont.systemFont(ofSize: 48)
        
        
        view.addSubview(label)
        view.addSubview(firstALabel)
        view.addSubview(mLabel)
        view.addSubview(bLabel)
        view.addSubview(dLabel)
        view.addSubview(lastALabel)
        
        
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        
    }
    
    private func rotateButtonTapped() {
        UIView.animate(withDuration: 2.0, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: .pi/4) // 2 pi is a complete rotation.
        }) { _ in
            UIView.animate(withDuration: 2.0) {
                self.label.transform = .identity // identity is the original state of the view which xcode remembers for us.
            }
        }
    }
    
    @IBAction func toggleBarTapped(_ sender: UIButton) {
        rotateButtonTapped()
    }
}

