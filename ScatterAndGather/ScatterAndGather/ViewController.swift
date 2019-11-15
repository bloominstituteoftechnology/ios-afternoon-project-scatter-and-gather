//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Craig Swanson on 11/14/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered: Bool = false
    let animationDuration = 3.5
    
    
    // MARK: - Outlets
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    @IBOutlet weak var lambaLogo: UIImageView!
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func togglebuttonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            gatherAnimation()
            isScattered = false
        } else {
            scatterAnimation()
            isScattered = true
        }
    }
    
    private func scatterAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 0.0
        }
    }
    
    private func gatherAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 1.0
        }
    }

}

// Just a test to see it animate.  Cool!!
//        UIView.animate(withDuration: 4.0, animations:  {
//            self.lambaLogo.transform = CGAffineTransform(rotationAngle: CGFloat.pi) }) { _ in
//                UIView.animate(withDuration: 1.0) {
//                    self.lambaLogo.transform = .identity
//                }
//
//        }
