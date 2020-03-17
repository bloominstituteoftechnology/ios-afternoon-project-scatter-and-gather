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
    @AutoLayoutFalse var stackView = UIStackView()
    @AutoLayoutFalse var imageView = UIImageView()

    // MARK: - View methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        //bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
        
        // Set tranlate to false
        var l, a, m, b, d, a2: UILabel
        
        
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(l)
        stackView.addArrangedSubview(a)
        stackView.addArrangedSubview(m)
        stackView.addArrangedSubview(b)
        stackView.addArrangedSubview(d)
        stackView.addArrangedSubview(a2)
        
        l.text = "L"
        
        
        view.addSubview(stackView)
        
    }
    
    
    // MARK: - private methods
    @objc func toggleButtonPressed() {
        
    }
    
}

@propertyWrapper struct AutoLayoutFalse {
    var wrappedValue: UIView {
        didSet { wrappedValue.translatesAutoresizingMaskIntoConstraints = false }
    }

    init(wrappedValue: UIView) {
        self.wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
