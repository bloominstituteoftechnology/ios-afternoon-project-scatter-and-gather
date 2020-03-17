//
//  ViewController.swift
//  Scatter And Gather
//
//  Created by Wyatt Harrell on 3/17/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLabel2: UILabel!
    
    let imageView = UIImageView()
    let colors = [UIColor.red, UIColor.purple, UIColor.green, UIColor.orange, UIColor.blue, UIColor.yellow, UIColor.brown, UIColor.cyan, UIColor.lightGray, UIColor.black]
    var isToggled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()
    }
    
    func setUpImageView() {
        imageView.image = UIImage(named: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        let labels = [lLabel, aLabel, mLabel, bLabel, dLabel, aLabel2]
        let maxX = Int(self.view.frame.maxX) - 50
        let maxY = Int(self.view.frame.maxY) - 50
                
        if isToggled {
            UIView.animate(withDuration: 2.0) {
                self.imageView.layer.opacity = 0
                for item in labels {
                    item!.layer.backgroundColor = self.colors[Int.random(in: 0...9)].cgColor
                    item!.textColor = self.colors[Int.random(in: 0...9)]
                    item!.center = CGPoint(x: Int.random(in: 0...maxX), y: Int.random(in: 0...maxY))
                    item!.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat(Int.random(in: 1...4)))
                    item!.transform3D = CATransform3DMakeRotation(CGFloat.pi / CGFloat(Int.random(in: 1...4)), 1, 1, 1)

                }
            }
            isToggled = false
        } else {
            UIView.animate(withDuration: 2.0) {
                self.imageView.layer.opacity = 1
                for item in labels {
                    item!.layer.backgroundColor = UIColor.white.cgColor
                    item!.textColor = UIColor.black
                    item!.transform = .identity
                    item!.center.y = 15
                }
                self.lLabel.center.x = 22
                self.aLabel.center.x = 88
                self.mLabel.center.x = 154
                self.bLabel.center.x = 220
                self.dLabel.center.x = 286
                self.aLabel2.center.x = 352
            }

            isToggled = true
        }
    }
}

