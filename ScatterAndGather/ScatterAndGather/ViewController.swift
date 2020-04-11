//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Chad Parker on 4/10/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let duration = 0.3
    
    var isScattered = false
    let l = UILabel()
    let a = UILabel()
    let m = UILabel()
    let b = UILabel()
    let d = UILabel()
    let aa = UILabel()
    let logoImageView = UIImageView()
    //let testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpViews()
    }
    
    private func setUpViews() {
        
        logoImageView.image = UIImage(named: "lambda_logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.5)
        ])
        
        let layoutFrame = view.safeAreaLayoutGuide.layoutFrame
        
        
        
        
        
//        testView.frame = layoutFrame
//        testView.backgroundColor = .blue
//        view.addSubview(testView)
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            animateGather()
            isScattered = false
        } else {
            animateScatter()
            isScattered = true
        }
    }
    
    /// fade out logo
    /// move letters to random locations
    /// assign random background and text color
    /// custom transform to rotate
    /// custom animations?
    private func animateScatter() {
        //Int.random(in: 0...)
        
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 0
        }
    }
    
    /// fade in logo
    /// reset letter properties
    /// move letters back to origin
    private func animateGather() {
        
        
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 1
        }
    }
}
