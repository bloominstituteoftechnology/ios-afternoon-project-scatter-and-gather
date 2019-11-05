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
        
        self.charLLabel.textColor = randomColor()
        self.charALabel.textColor = randomColor()
        self.charMLabel.textColor = randomColor()
        self.charBLabel.textColor = randomColor()
        self.charDLabel.textColor = randomColor()
        self.charAALabel.textColor = randomColor()
        
        
        UIView.animate(withDuration: 2.0) {
            self.charLLabel.center = self.randomPoint(from: self.charLLabel)
            self.charLLabel.layer.backgroundColor = self.randomColor().cgColor
            
            self.charALabel.center = self.randomPoint(from: self.charALabel)
            self.charALabel.layer.backgroundColor = self.randomColor().cgColor
            
            self.charMLabel.center = self.randomPoint(from: self.charMLabel)
            self.charMLabel.layer.backgroundColor = self.randomColor().cgColor
            
            self.charBLabel.center = self.randomPoint(from: self.charBLabel)
            self.charBLabel.layer.backgroundColor = self.randomColor().cgColor
            
            self.charDLabel.center = self.randomPoint(from: self.charDLabel)
            self.charDLabel.layer.backgroundColor = self.randomColor().cgColor
            
            self.charAALabel.center = self.randomPoint(from: self.charAALabel)
            self.charAALabel.layer.backgroundColor = self.randomColor().cgColor
            
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
    
    private func randomColor() -> UIColor {
        let randNum = Int.random(in: 0...6)
        switch randNum {
        case 0:
            return UIColor.red
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.brown
        case 3:
            return UIColor.cyan
        case 4:
            return UIColor.green
        case 5:
            return UIColor.yellow
        case 6:
            return UIColor.orange
        default:
            return UIColor.black
        }
    }
    
    
    private func gather() {
        
        self.charLLabel.textColor = UIColor.black
        self.charALabel.textColor = UIColor.black
        self.charMLabel.textColor = UIColor.black
        self.charBLabel.textColor = UIColor.black
        self.charDLabel.textColor = UIColor.black
        self.charAALabel.textColor = UIColor.black
        
        UIView.animate(withDuration: 2.0) {
            self.charLLabel.center = self.charLOriginPoint
            self.charLLabel.layer.backgroundColor = UIColor.clear.cgColor
            
            self.charALabel.center = self.charAOriginPoint
            self.charALabel.layer.backgroundColor = UIColor.clear.cgColor
            
            self.charMLabel.center = self.charMOriginPoint
            self.charMLabel.layer.backgroundColor = UIColor.clear.cgColor
            
            self.charBLabel.center = self.charBOriginPoint
            self.charBLabel.layer.backgroundColor = UIColor.clear.cgColor
            
            self.charDLabel.center = self.charDOriginPoint
            self.charDLabel.layer.backgroundColor = UIColor.clear.cgColor
            
            self.charAALabel.center = self.charAAOriginPoint
            self.charAALabel.layer.backgroundColor = UIColor.clear.cgColor
            
            self.logoImageView.alpha = 1.0
        }
    }
    
}

