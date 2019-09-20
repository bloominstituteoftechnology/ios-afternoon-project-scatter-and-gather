//
//  ViewController.swift
//  Scatter
//
//  Created by John Kouris on 9/20/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let letter1 = UILabel()
    let letter2 = UILabel()
    let letter3 = UILabel()
    let letter4 = UILabel()
    let letter5 = UILabel()
    let letter6 = UILabel()
    let image = UIImageView()
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabelsAndImage()
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        runAnimation()
    }
    
    private func configureLabelsAndImage() {
        
        letter1.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter1)
        letter1.text = "L"
        
        letter2.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter2)
        letter2.text = "a"
        
        letter3.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter3)
        letter3.text = "m"
        
        letter4.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter4)
        letter4.text = "b"
        
        letter5.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter5)
        letter5.text = "d"
        
        letter6.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(letter6)
        letter6.text = "a"
        
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        image.image = UIImage(named: "lambda_logo")
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(letter1)
        stackView.addArrangedSubview(letter2)
        stackView.addArrangedSubview(letter3)
        stackView.addArrangedSubview(letter4)
        stackView.addArrangedSubview(letter5)
        stackView.addArrangedSubview(letter6)
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        image.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func runAnimation() {
        if isScattered {
            isScattered = false
            UIView.animate(withDuration: 2) {
                self.image.alpha = 1
                self.letter1.transform = .identity
            }
        } else {
            isScattered = true
            
            
            UIView.animate(withDuration: 2) {
                self.image.alpha = 0
                self.letter1.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            }
        }
    }
    


}

