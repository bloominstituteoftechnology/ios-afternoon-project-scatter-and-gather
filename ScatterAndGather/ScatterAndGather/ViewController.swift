//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Enrique Gongora on 2/18/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    var isScattered: Bool = false
    
    //MARK: - Image
    var imageView: UIImageView!
    var letters: [UILabel] = []
    
    //MARK: - IBAction
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        if isScattered {
            scatterAnimation()
        } else {
            gatherAnimation()
        }
    }
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
    }
    
    //MARK: - SetUp Function
    func viewSetUp() {
        
        // Image
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        self.imageView = imageView
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 1.5).isActive = true
        
        // Label L
        let labelL = UILabel()
        labelL.translatesAutoresizingMaskIntoConstraints = false
        labelL.text = "L"
        labelL.textAlignment = .center
        labelL.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labelL)
        letters.append(labelL)
        
        labelL.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelL.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        
        // Label A
        let labelA = UILabel()
        labelA.translatesAutoresizingMaskIntoConstraints = false
        labelA.text = "A"
        labelA.textAlignment = .center
        labelA.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labelA)
        letters.append(labelA)
        
        labelA.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelA.leadingAnchor.constraint(equalTo: labelL.trailingAnchor, constant: 20).isActive = true
        
        // Label M
        let labelM = UILabel()
        labelM.translatesAutoresizingMaskIntoConstraints = false
        labelM.text = "M"
        labelM.textAlignment = .center
        labelM.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labelM)
        letters.append(labelM)
        
        labelM.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelM.leadingAnchor.constraint(equalTo: labelA.trailingAnchor, constant: 20).isActive = true
        
        // Label B
        let labelB = UILabel()
        labelB.translatesAutoresizingMaskIntoConstraints = false
        labelB.text = "B"
        labelB.textAlignment = .center
        labelB.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labelB)
        letters.append(labelB)
        
        labelB.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelB.leadingAnchor.constraint(equalTo: labelM.trailingAnchor, constant: 20).isActive = true
        
        // Label D
        let labelD = UILabel()
        labelD.translatesAutoresizingMaskIntoConstraints = false
        labelD.text = "D"
        labelD.textAlignment = .center
        labelD.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labelD)
        letters.append(labelD)
        
        labelD.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelD.leadingAnchor.constraint(equalTo: labelB.trailingAnchor, constant: 20).isActive = true
        
        // Label 2nd A
        let labelAA = UILabel()
        labelAA.translatesAutoresizingMaskIntoConstraints = false
        labelAA.text = "A"
        labelAA.textAlignment = .center
        labelAA.font = UIFont.systemFont(ofSize: 60)
        view.addSubview(labelAA)
        letters.append(labelAA)
        
        labelAA.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelAA.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
    }
    
    //MARK: - Scatter Function
    func scatterAnimation() {
        UIView.animate(withDuration: 1.5) {
            self.imageView.alpha = 0.0
            for letter in self.letters {
                letter.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...250), y: CGFloat.random(in: 0...660)).rotated(by: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                letter.textColor = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                letter.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            }
        }
    }
    
    func gatherAnimation() {
        UIView.animate(withDuration: 1.5) {
            self.imageView.alpha = 1.0
            for letter in self.letters {
                letter.transform = .identity
                letter.backgroundColor = UIColor.white
                letter.textColor = UIColor.black
            }
        }
    }
}

