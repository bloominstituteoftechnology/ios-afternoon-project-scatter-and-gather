//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Jordan Christensen on 9/11/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var firstALabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    
    var lCenter: CGPoint?
    var firstACenter: CGPoint?
    var mCenter: CGPoint?
    var bCenter: CGPoint?
    var dCetner: CGPoint?
    var secondACenter: CGPoint?
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        savePositions()
        setUI()
    }
    
    func setUI() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.79, green:0.00, blue:0.14, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func savePositions() {
        lCenter = lLabel.center
        firstACenter = firstALabel.center
        mCenter = mLabel.center
        bCenter = bLabel.center
        dCetner = dLabel.center
        secondACenter = secondALabel.center
    }
    
    func returnPositions() {
        guard let l = lCenter, let firstA = firstACenter, let m = mCenter, let b = bCenter, let d = dCetner, let secondA = secondACenter else { return }
        UIView.animate(withDuration: 1.5) {
            self.lLabel.center = l
            self.firstALabel.center = firstA
            self.mLabel.center = m
            self.bLabel.center = b
            self.dLabel.center = d
            self.secondALabel.center = secondA
            
            self.lambdaLogoImageView.alpha = 1.00
        }
    }
    
    func getRandomX() -> Int {
        // Returns a range of X: -175-175 to fit on screen
        let x = Int.random(in: -75...305)
        return x
    }
    
    func getRandomY() -> Int {
        // Returns a range of Y: -400-400 to fit on screen
        let y = Int.random(in: -200...450)
        return y
    }
    
    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        if (!isScattered) {
            UIView.animate(withDuration: 1.5) {
                self.lambdaLogoImageView.alpha = 0.00
                self.lLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.firstALabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.mLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.bLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.dLabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
                self.secondALabel.center = CGPoint(x: self.getRandomX(), y: self.getRandomY())
            }
        } else {
            returnPositions()
        }
        
        isScattered = !isScattered
    }
}

