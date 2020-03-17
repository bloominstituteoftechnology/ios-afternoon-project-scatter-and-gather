//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Lambda_School_Loaner_259 on 3/17/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered = Bool()
    let stackView = UIStackView()
    let imageView = UIImageView()
    let l = UILabel()
    let a = UILabel()
    let m = UILabel()
    let b = UILabel()
    let d = UILabel()
    let a2 = UILabel()

    // MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        //bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
        
        // Set tranlate to false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        l.translatesAutoresizingMaskIntoConstraints = false
        a.translatesAutoresizingMaskIntoConstraints = false
        m.translatesAutoresizingMaskIntoConstraints = false
        b.translatesAutoresizingMaskIntoConstraints = false
        d.translatesAutoresizingMaskIntoConstraints = false
        a2.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to view
        view.addSubview(stackView)
        view.addSubview(imageView)
        
        // StackView settings
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(l)
        stackView.addArrangedSubview(a)
        stackView.addArrangedSubview(m)
        stackView.addArrangedSubview(b)
        stackView.addArrangedSubview(d)
        stackView.addArrangedSubview(a2)
        
        // Labels text
        l.text = "L"
        a.text = "a"
        m.text = "m"
        b.text = "b"
        d.text = "d"
        a2.text = "a"
        
        // ImageView constraints & image
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.safeAreaLayoutGuide.layoutFrame.height / 4),
            imageView.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width / 2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.25)
        ])
        imageView.image = UIImage(named: "lambda_logo")
        
        
        // StackView Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }
    
    
    // MARK: - private methods
    @objc func toggleButtonPressed() {
        UIView.animate(withDuration: 4.0) {
            self.imageView.alpha = 0.0
        }
    }
    
}

//@propertyWrapper struct AutoLayoutFalse {
//    var wrappedValue: UIView {
//        didSet { wrappedValue.translatesAutoresizingMaskIntoConstraints = false }
//    }
//
//    init(wrappedValue: UIView) {
//        self.wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//    }
//}
