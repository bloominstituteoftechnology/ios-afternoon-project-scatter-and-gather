//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Karen Rodriguez on 3/17/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var l = UILabel(), a = UILabel(), m = UILabel(), b = UILabel(), d = UILabel(), a2 = UILabel()

    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpLabels()
    }

    private func setUpLabels() {
        l.text = "L"
        l.font = UIFont.boldSystemFont(ofSize: 40)
        
        a.text = "a"
        a.font = UIFont.boldSystemFont(ofSize: 40)
        
        m.text = "m"
        m.font = UIFont.boldSystemFont(ofSize: 40)
        
        b.text = "b"
        b.font = UIFont.boldSystemFont(ofSize: 40)
        
        d.text = "d"
        d.font = UIFont.boldSystemFont(ofSize: 40)
        
        a2.text = "a"
        a2.font = UIFont.boldSystemFont(ofSize: 40)
        
        l.translatesAutoresizingMaskIntoConstraints = false
        a.translatesAutoresizingMaskIntoConstraints = false
        m.translatesAutoresizingMaskIntoConstraints = false
        b.translatesAutoresizingMaskIntoConstraints = false
        d.translatesAutoresizingMaskIntoConstraints = false
        a2.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        
        stackView.addArrangedSubview(l)
        stackView.addArrangedSubview(a)
        stackView.addArrangedSubview(m)
        stackView.addArrangedSubview(b)
        stackView.addArrangedSubview(d)
        stackView.addArrangedSubview(a2)
        
        let uiImage = UIImageView(image: UIImage(named: "lambda_logo"))
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uiImage)
        uiImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            uiImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            uiImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            uiImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            
            
        ])
        
        
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
}

