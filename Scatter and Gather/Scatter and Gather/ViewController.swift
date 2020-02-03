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
    
    @IBOutlet weak var letterLLabel: UILabel!
    @IBOutlet weak var letterALabel: UILabel!
    @IBOutlet weak var letterMLabel: UILabel!
    @IBOutlet weak var letterBLabel: UILabel!
    @IBOutlet weak var letterDLabel: UILabel!
    @IBOutlet weak var secondLetterALabel: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    var isScattered = false
    var LOriginPoint: CGPoint!
    var AOriginPoint: CGPoint!
    var MOriginPoint: CGPoint!
    var BOriginPoint: CGPoint!
    var DOriginPoint: CGPoint!
    var AAOriginPoint: CGPoint!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelOrigin()
        lambdaLogo.isOpaque = false
        isDraggable()

        
    }
    
    func isDraggable() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(wasDragged(_:)))
        lambdaLogo.addGestureRecognizer(gesture)
        lambdaLogo.isUserInteractionEnabled = true
        
        // TODO: Implement dragging letter labels

    }
    
    
    // MARK: - Draggable Function
    
    @objc private func wasDragged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        let label = gesture.view!
        
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: self.view)
    }
    // MARK: - Scatter Functions
    
    
    private func scatter() {
        //Sets random text color
        self.letterLLabel.textColor = randomColor()
        self.letterALabel.textColor = randomColor()
        self.letterMLabel.textColor = randomColor()
        self.letterBLabel.textColor = randomColor()
        self.letterDLabel.textColor = randomColor()
        self.secondLetterALabel.textColor = randomColor()
        
        // Animates labels with random background color, transforms with random angle, and sends to random location
        UIView.animate(withDuration: 3.0) {
            self.letterLLabel.center = self.randomPoint(from: self.letterLLabel)
            self.letterLLabel.layer.backgroundColor = self.randomColor().cgColor
            // Animates shadows
            self.letterLLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterLLabel.layer.shadowRadius = 3.0
            self.letterLLabel.layer.shadowOpacity = 1.0
            self.letterLLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.letterLLabel.layer.masksToBounds = false
            //Animates 3D
            self.letterLLabel.transform3D = CATransform3DMakeRotation(self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle())
            
            
            self.letterALabel.center = self.randomPoint(from: self.letterALabel)
            self.letterALabel.layer.backgroundColor = self.randomColor().cgColor
            self.letterALabel.layer.shadowColor = UIColor.black.cgColor
            self.letterALabel.layer.shadowRadius = 3.0
            self.letterALabel.layer.shadowOpacity = 1.0
            self.letterALabel.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.letterALabel.layer.masksToBounds = false
            self.letterALabel.transform3D = CATransform3DMakeRotation(self.randomAngle(), // Angle
                self.randomAngle(), // X
                self.randomAngle(), // Y
                self.randomAngle()) // Z
            
            self.letterMLabel.center = self.randomPoint(from: self.letterMLabel)
            self.letterMLabel.layer.backgroundColor = self.randomColor().cgColor
            self.letterMLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterMLabel.layer.shadowRadius = 3.0
            self.letterMLabel.layer.shadowOpacity = 1.0
            self.letterMLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.letterMLabel.layer.masksToBounds = false
            self.letterMLabel.transform3D = CATransform3DMakeRotation(self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle())
            
            self.letterBLabel.center = self.randomPoint(from: self.letterBLabel)
            self.letterBLabel.layer.backgroundColor = self.randomColor().cgColor
            self.letterBLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterBLabel.layer.shadowRadius = 3.0
            self.letterBLabel.layer.shadowOpacity = 1.0
            self.letterBLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.letterBLabel.layer.masksToBounds = false
            self.letterBLabel.transform3D = CATransform3DMakeRotation(self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle())
            
            self.letterDLabel.center = self.randomPoint(from: self.letterDLabel)
            self.letterDLabel.layer.backgroundColor = self.randomColor().cgColor
            self.letterDLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterDLabel.layer.shadowRadius = 3.0
            self.letterDLabel.layer.shadowOpacity = 1.0
            self.letterDLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.letterDLabel.layer.masksToBounds = false
            self.letterDLabel.transform3D = CATransform3DMakeRotation(self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle(),
                                                                      self.randomAngle())
            
            self.secondLetterALabel.center = self.randomPoint(from: self.secondLetterALabel)
            self.secondLetterALabel.layer.backgroundColor = self.randomColor().cgColor
            self.secondLetterALabel.layer.shadowColor = UIColor.black.cgColor
            self.secondLetterALabel.layer.shadowRadius = 3.0
            self.secondLetterALabel.layer.shadowOpacity = 1.0
            self.secondLetterALabel.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.secondLetterALabel.layer.masksToBounds = false
            self.secondLetterALabel.transform3D = CATransform3DMakeRotation(self.randomAngle(),
                                                                            self.randomAngle(),
                                                                            self.randomAngle(),
                                                                            self.randomAngle())
            
            self.lambdaLogo.alpha = 0.0 // Fades out image
        }
        
    }
    
    private func setLabelOrigin() {
        LOriginPoint = self.letterLLabel.center
        AOriginPoint = self.letterALabel.center
        MOriginPoint = self.letterMLabel.center
        BOriginPoint = self.letterBLabel.center
        DOriginPoint = self.letterDLabel.center
        AAOriginPoint = self.secondLetterALabel.center
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
    
    // MARK: - Gather
    private func gather() {
        // Resets text color
        self.letterLLabel.textColor = UIColor.black
        self.letterALabel.textColor = UIColor.black
        self.letterMLabel.textColor = UIColor.black
        self.letterBLabel.textColor = UIColor.black
        self.letterDLabel.textColor = UIColor.black
        self.secondLetterALabel.textColor = UIColor.black
        
        //Resets starting location and background color
        UIView.animate(withDuration: 3.0) {
            self.letterLLabel.center = self.LOriginPoint
            self.letterLLabel.layer.backgroundColor = UIColor.clear.cgColor
            // Animates shadows
            self.letterLLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterLLabel.layer.shadowRadius = 0.0
            self.letterLLabel.layer.shadowOpacity = 0.0
            self.letterLLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.letterLLabel.layer.masksToBounds = false
            self.letterLLabel.transform = .identity
            
            self.letterALabel.center = self.AOriginPoint
            self.letterALabel.layer.backgroundColor = UIColor.clear.cgColor
            self.letterALabel.layer.shadowColor = UIColor.black.cgColor
            self.letterALabel.layer.shadowRadius = 0.0
            self.letterALabel.layer.shadowOpacity = 0.0
            self.letterALabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.letterALabel.layer.masksToBounds = false
            self.letterALabel.transform = .identity
            
            self.letterMLabel.center = self.MOriginPoint
            self.letterMLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.letterMLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterMLabel.layer.shadowRadius = 0.0
            self.letterMLabel.layer.shadowOpacity = 0.0
            self.letterMLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.letterMLabel.layer.masksToBounds = false
            self.letterMLabel.transform = .identity
            
            self.letterBLabel.center = self.BOriginPoint
            self.letterBLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.letterBLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterBLabel.layer.shadowRadius = 0.0
            self.letterBLabel.layer.shadowOpacity = 0.0
            self.letterBLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.letterBLabel.layer.masksToBounds = false
            self.letterBLabel.transform = .identity
            
            self.letterDLabel.center = self.DOriginPoint
            self.letterDLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.letterDLabel.layer.shadowColor = UIColor.black.cgColor
            self.letterDLabel.layer.shadowRadius = 0.0
            self.letterDLabel.layer.shadowOpacity = 0.0
            self.letterDLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.letterDLabel.layer.masksToBounds = false
            self.letterDLabel.transform = .identity
            
            self.secondLetterALabel.center = self.AAOriginPoint
            self.secondLetterALabel.layer.backgroundColor = UIColor.clear.cgColor
            self.secondLetterALabel.layer.shadowColor = UIColor.black.cgColor
            self.secondLetterALabel.layer.shadowRadius = 0.0
            self.secondLetterALabel.layer.shadowOpacity = 0.0
            self.secondLetterALabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.secondLetterALabel.layer.masksToBounds = false
            self.secondLetterALabel.transform = .identity
            
            self.lambdaLogo.alpha = 1.0 // Fades in image
        }
    }
    
    // MARK: - IBActions
    @IBAction func toggleButtonPressed(sender: UIBarButtonItem) {
        if isScattered {
            gather()
        } else {
            scatter()
        }
        isScattered.toggle()
    }
}
