//
//  ScatterViewController.swift
//  Scatter and gather
//
//  Created by Alex Thompson on 11/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ScatterViewController: UIViewController {
    
    var isScattered = false
    var labels: [UILabel] = []
    
    var lOrigin: CGPoint!
    var aOrigin: CGPoint!
    var mOrigin: CGPoint!
    var bOrigin: CGPoint!
    var dOrigin: CGPoint!
    var a2Origin: CGPoint!
    
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLabel2: UILabel!
    @IBOutlet weak var lambdaImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelPointOrigins()
        lambdaImage.isOpaque = false

        // Do any additional setup after loading the view.
    }
    
    private func setLabelPointOrigins() {
        lOrigin = self.lLabel.center
        aOrigin = self.aLabel.center
        mOrigin = self.mLabel.center
        bOrigin = self.bLabel.center
        dOrigin = self.dLabel.center
        a2Origin = self.aLabel2.center
        
    }
    
    private func Scatter() {
        self.lLabel.textColor = randomColor()
        self.aLabel.textColor = randomColor()
        self.mLabel.textColor = randomColor()
        self.bLabel.textColor = randomColor()
        self.dLabel.textColor = randomColor()
        self.aLabel2.textColor = randomColor()
        
        UIView.animate(withDuration: 2.0) {
            self.lambdaImage.alpha = 0.0
            self.lLabel.center = self.randomPoint(from: self.lLabel)
            self.lLabel.layer.backgroundColor = self.randomColor().cgColor
            self.lLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            
            self.aLabel.center = self.randomPoint(from: self.aLabel)
            self.aLabel.layer.backgroundColor = self.randomColor().cgColor
            self.aLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            
            self.mLabel.center = self.randomPoint(from: self.mLabel)
            self.mLabel.layer.backgroundColor = self.randomColor().cgColor
            self.mLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            
            self.bLabel.center = self.randomPoint(from: self.bLabel)
            self.bLabel.layer.backgroundColor = self.randomColor().cgColor
            self.bLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            
            self.dLabel.center = self.randomPoint(from: self.dLabel)
            self.dLabel.layer.backgroundColor = self.randomColor().cgColor
            self.dLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            
            self.aLabel2.center = self.randomPoint(from: self.aLabel2)
            self.aLabel2.layer.backgroundColor = self.randomColor().cgColor
            self.aLabel2.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            
        }
    }
    
    private func randomAngle() -> CGFloat {
        let angle = CGFloat(Int.random(in: 1...10))
        if (Int.random(in: 1...100) % 2) == 0 {
            return CGFloat.pi / angle
        } else {
            return -1 * CGFloat.pi / angle
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
        maxY = maxY - labelWidth
        
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
        self.lLabel.textColor = UIColor.black
        self.aLabel.textColor = UIColor.black
        self.mLabel.textColor = UIColor.black
        self.bLabel.textColor = UIColor.black
        self.dLabel.textColor = UIColor.black
        self.aLabel2.textColor = UIColor.black
        
        UIView.animate(withDuration: 2.0) {
            self.lambdaImage.alpha = 1.0
            self.lLabel.center = self.lOrigin
            self.lLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.lLabel.transform = .identity
            
            self.aLabel.center = self.aOrigin
            self.aLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.aLabel.transform = .identity
            
            self.mLabel.center = self.mOrigin
            self.mLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.mLabel.transform = .identity
            
            self.bLabel.center = self.bOrigin
            self.bLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.bLabel.transform = .identity
            
            self.dLabel.center = self.dOrigin
            self.dLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.dLabel.transform = .identity
            
            self.aLabel2.center = self.a2Origin
            self.aLabel2.layer.backgroundColor = UIColor.clear.cgColor
            self.aLabel2.transform = .identity
            
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            gather()
        } else {
            Scatter()
            
        }
        
        isScattered.toggle()
    }
}
