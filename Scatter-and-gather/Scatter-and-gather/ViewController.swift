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

    var charLOriginPoint: CGPoint!
    var charAOriginPoint: CGPoint!
    var charMOriginPoint: CGPoint!
    var charBOriginPoint: CGPoint!
    var charDOriginPoint: CGPoint!
    var charAAOriginPoint: CGPoint!
        
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabelPointOrigins()
        logoImageView.isOpaque = false
    }
    
    private func setLabelPointOrigins() {
        charLOriginPoint = self.charLLabel.center
        charAOriginPoint = self.charALabel.center
        charMOriginPoint = self.charMLabel.center
        charBOriginPoint = self.charBLabel.center
        charDOriginPoint = self.charDLabel.center
        charAAOriginPoint = self.charAALabel.center
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
        
        UIView.animate(withDuration: 2.0) {
            self.charLLabel.center = self.randomPoint(from: self.charLLabel)
            self.charALabel.center = self.randomPoint(from: self.charALabel)
            self.charMLabel.center = self.randomPoint(from: self.charMLabel)
            self.charBLabel.center = self.randomPoint(from: self.charBLabel)
            self.charDLabel.center = self.randomPoint(from: self.charDLabel)
            self.charAALabel.center = self.randomPoint(from: self.charAALabel)
            self.logoImageView.alpha = 0.0
        }
        
    }
    
    private func randomPoint(from label: UILabel) -> CGPoint {
        
        let minX = Int(view.bounds.minX)
        var maxX = Int(view.bounds.maxX)
        let minY = Int(view.bounds.minY)
        var maxY = Int(view.bounds.maxY)
        
        let labelHeight = Int(label.bounds.size.height)
        let labelWidth = Int(label.bounds.size.width)
        
        maxX = maxX - labelWidth
        maxY = maxY - labelHeight
        
        let randXPoint = CGFloat(Int.random(in: minX...maxX))
        let randYPoint = CGFloat(Int.random(in: minY...maxY))
        return CGPoint(x: randXPoint, y: randYPoint)
    }
    
    
    private func gather() {
        
        UIView.animate(withDuration: 2.0) {
            self.charLLabel.center = self.charLOriginPoint
            self.charALabel.center = self.charAOriginPoint
            self.charMLabel.center = self.charMOriginPoint
            self.charBLabel.center = self.charBOriginPoint
            self.charDLabel.center = self.charDOriginPoint
            self.charAALabel.center = self.charAAOriginPoint
            self.logoImageView.alpha = 1.0
        }
    }
    
}

