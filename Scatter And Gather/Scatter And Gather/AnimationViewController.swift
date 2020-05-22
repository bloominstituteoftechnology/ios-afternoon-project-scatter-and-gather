//
//  AnimationViewController.swift
//  Scatter And Gather
//
//  Created by Bronson Mullens on 5/22/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered: Bool = false
    
    // MARK: - IBOutlets
    
    // MARK: - IBActions
    @IBAction func toggleButtonTapped(_ sender: Any) {
        isScattered.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
