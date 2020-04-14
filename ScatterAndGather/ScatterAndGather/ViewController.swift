//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Shawn James on 4/14/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    @IBOutlet weak var letterLabels: UILabel!
    
    private var isScattered = false {
        // dynamic toggle button title
        didSet {
            switch isScattered {
            case true:
                toggleButton.title = "Gather Letters"
            default:
                toggleButton.title = "Scatter Letters"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        switch isScattered {
        case true:
            // perform gather animation sequence
            resetLetters()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.fadeInLogo(self.lambdaLogoImageView)
            }
        default:
            // perform scatter animation sequence
            fadeOutLogo(lambdaLogoImageView)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.moveLettersToRandomLocations()
                self.assignLettersRandomColors()
                self.rotateLetters()
            }
        }
        
        // toggle isScattered
        isScattered.toggle()
    }
    
    
    // MARK: - Scatter Animation Methods
    
    private func fadeOutLogo(_ logo: UIImageView) {
        UIView.animate(withDuration: 2) { logo.alpha = 0 }
    }
    
    private func moveLettersToRandomLocations() {
        
    }
    
    private func assignLettersRandomColors() {
        
    }
    
    private func rotateLetters() {
    }
    
    // MARK: - Gather Animation Methods
    
    private func fadeInLogo(_ logo: UIImageView) {
        UIView.animate(withDuration: 2) { logo.alpha = 1 }
    }
    
    private func resetLetters() {
        letterLabels.transform = .identity
    }
    
}

