//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Matthew Martindale on 4/8/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    
    var lLabel: UILabel!
    var aLabel: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!

    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    func configureLabels() {
        lLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        aLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        dLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        a2Label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lLabel)
        view.addSubview(aLabel)
        view.addSubview(mLabel)
        view.addSubview(bLabel)
        view.addSubview(dLabel)
        view.addSubview(a2Label)
        
        lLabel.text = "L"
        aLabel.text = "a"
        mLabel.text = "m"
        bLabel.text = "b"
        dLabel.text = "d"
        a2Label.text = "a"
        
        lLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        aLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        mLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        bLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        dLabel.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        a2Label.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 15).isActive = true
        aLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 15).isActive = true
        mLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 15).isActive = true
        bLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 15).isActive = true
        dLabel.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
        
        a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 15).isActive = true
        a2Label.topAnchor.constraint(equalTo: lLabel.topAnchor).isActive = true
    }
//
//    func randomRotation() -> [Int] {
//        var randomRotationArray: [Int] = []
//        for _ in 1...6 {
//            randomRotationArray.append(Int.random(in: 1...36))
//        }
//        return randomRotationArray
//    }
//
//    func randomColor() -> [Int] {
//        var randomColorArray: [Int] = []
//        for _ in 1...2 {
//            randomColorArray.append(Int.random(in: 1...6))
//        }
//        return randomColorArray
//    }
    
    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        
        view.backgroundColor = .randomColor()
        
        isScattered.toggle()
        
        if isScattered == true {
            UIView.animate(withDuration: 1) {
                self.lambdaLogoImageView.alpha = 0
            }
            
            UIView.animate(withDuration: 1) {
                self.lLabel.transform = CGAffineTransform(
                    translationX: CGFloat.random(in: 0...self.view.frame.size.width - 100),
                    y: CGFloat.random(in: 0...self.view.frame.size.height - 200))
            }
        }
        else {
            UIView.animate(withDuration: 1) {
                self.lambdaLogoImageView.alpha = 1
            }
            
            UIView.animate(withDuration: 1) {
                self.lLabel.transform = .identity
            }
            
        }
    }
}



