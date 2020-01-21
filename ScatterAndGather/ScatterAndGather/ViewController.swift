//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Tobi Kuyoro on 21/01/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Properties
    
    var isScattered: Bool = false
    var lLabel: UILabel!
    var a1Label: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!
    var imageView: UIImageView!
    
    // MARK:- View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
    }
    
    func configureLabels() {
        // L Label
        lLabel = UILabel()
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 72)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lLabel)
        
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        
        //A1 Label
        a1Label = UILabel()
        a1Label.text = "a"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 72)
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(a1Label)
        
        a1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        a1Label.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 15).isActive = true
        
        //M Label
        mLabel = UILabel()
        mLabel.text = "m"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 72)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: a1Label.trailingAnchor, constant: 15).isActive = true
        
        //B Label
        bLabel = UILabel()
        bLabel.text = "b"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 72)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bLabel)
        
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 15).isActive = true
        
        //D Label
        dLabel = UILabel()
        dLabel.text = "d"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 72)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dLabel)
        
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 15).isActive = true
        
        //A2 Label
        a2Label = UILabel()
        a2Label.text = "a"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 72)
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(a2Label)
        
        a2Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 15).isActive = true
    }
    
    // MARK:- Actions
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
    }
    
}

