//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by denis cedeno on 11/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var isScattered: Bool = false
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    @IBOutlet var mLabel: UILabel!
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var secondALabel: UILabel!
    
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == true {
            gather()
        } else {
            scatter()
        }
        isScattered.toggle()
    }
    
    func gather() {
        UIView.animate(withDuration: 3.0) {
                   self.lambdaLogoImageView.alpha = 1.0
               }
    }
    func scatter() {
        UIView.animate(withDuration: 3.0) {
            self.lambdaLogoImageView.alpha = 0.0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    func configureLabels() {
        lLabel = UILabel()
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(lLabel)
        
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90).isActive = true
        
        aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "a"
        aLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(aLabel)
        
        aLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 8).isActive = true
        
        mLabel = UILabel()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "m"
        mLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(mLabel)
        
        mLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 8).isActive = true
        
        bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "b"
        bLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(bLabel)
        
        bLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 8).isActive = true
        
        dLabel = UILabel()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "d"
        dLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(dLabel)
        
        dLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 8).isActive = true
        
        secondALabel = UILabel()
        secondALabel.translatesAutoresizingMaskIntoConstraints = false
        secondALabel.text = "a"
        secondALabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(secondALabel)
        
        secondALabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        secondALabel.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 8).isActive = true
        
       }
 
}

