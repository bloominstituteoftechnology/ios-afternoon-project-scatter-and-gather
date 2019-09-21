//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Joel Groomer on 9/21/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblL: UILabel!
    @IBOutlet weak var lblA1: UILabel!
    @IBOutlet weak var lblM: UILabel!
    @IBOutlet weak var lblB: UILabel!
    @IBOutlet weak var lblD: UILabel!
    @IBOutlet weak var lblA2: UILabel!
    
    var isScattered = false
    var labelConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setupLabels() {
//        let logoWidth = imgLogo.frame.width
        
        // image constraints were set in Storyboard
        // height and width constraints for labels were set in Storyboard
        labelConstraints = [lblL.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 20),
                            lblA1.topAnchor.constraint(equalTo: lblL.topAnchor),
                            lblM.topAnchor.constraint(equalTo: lblL.topAnchor),
                            lblB.topAnchor.constraint(equalTo: lblL.topAnchor),
                            lblD.topAnchor.constraint(equalTo: lblL.topAnchor),
                            lblA2.topAnchor.constraint(equalTo: lblL.topAnchor),
                            lblL.leadingAnchor.constraint(equalTo: imgLogo.leadingAnchor),
                            lblA1.leadingAnchor.constraint(equalTo: lblL.trailingAnchor),
                            lblM.leadingAnchor.constraint(equalTo: lblA1.trailingAnchor),
                            lblB.leadingAnchor.constraint(equalTo: lblM.trailingAnchor),
                            lblD.leadingAnchor.constraint(equalTo: lblB.trailingAnchor),
                            lblA2.leadingAnchor.constraint(equalTo: lblD.trailingAnchor)
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }

    @IBAction func toggleButtonTapped(_ sender: Any) {
        
    }
    
}

