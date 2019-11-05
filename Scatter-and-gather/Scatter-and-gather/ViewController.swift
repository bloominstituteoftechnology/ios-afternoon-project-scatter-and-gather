//
//  ViewController.swift
//  Scatter-and-gather
//
//  Created by Lambda_School_Loaner_204 on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    // UILabels
    @IBOutlet weak var charLLabel: UILabel!
    @IBOutlet weak var charALabel: UILabel!
    @IBOutlet weak var charMLabel: UILabel!
    @IBOutlet weak var charBLabel: UILabel!
    @IBOutlet weak var charDLabel: UILabel!
    @IBOutlet weak var charAALabel: UILabel!

    // ImageViews
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Properties
    
    var isScattered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logoImageView.isOpaque = false
    }

    // MARK: - IBActions
    @IBAction func toggleButtonPressed(sender: UIBarButtonItem) {
        if isScattered {
            gather()
        } else {
            scatter()
        }
        
        // Call toggle to switch bool after clicked
        isScattered.toggle()
    }
    
    // MARK: - Actions
    
    private func scatter() {

        let minX = Int(self.view.bounds.minX)
        let maxX = Int(self.view.bounds.maxX)
        let minY = Int(self.view.bounds.minY)
        let maxY = Int(self.view.bounds.maxY)
        
        
        let randXPoint = Int.random(in: minX...maxX)
        let randYPoint = Int.random(in: minY...maxY)
        
        
        
        UIView.animate(withDuration: 2.0) {
            self.charLLabel.center = CGPoint(x: CGFloat(randXPoint), y: CGFloat(randYPoint))
            self.logoImageView.alpha = 0.0
        }
        
    }
    
    private func gather() {
        
        UIView.animate(withDuration: 2.0) {
            self.logoImageView.alpha = 1.0
        }
    }
    
}

