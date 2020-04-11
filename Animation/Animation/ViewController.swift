//
//  ViewController.swift
//  Animation
//
//  Created by Claudia Contreras on 4/10/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    var isScattered: Bool = false
    
    //MARK: - IBOutlets
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    @IBOutlet var mLabel: UILabel!
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var a2Label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            gatherAnimation()
        } else {
            scatterAnimation()
        }
        
        isScattered.toggle()
    }
    
    //MARK: - Animation Functions
    private func scatterAnimation() {
        fadeLogo()
    }
    
    private func gatherAnimation() {
        unfadeLogo()
    }
    
    private func fadeLogo() {
        imageView.center = view.center
        
        UIView.animate(withDuration: 3.0) {
            self.imageView.alpha = 0.0
        }
    }
    
    private func unfadeLogo() {
        UIView.animate(withDuration: 3.0) {
            self.imageView.alpha = 1.0
        }
    }
    
    private func getRandomLocation() {
        
    }
}

