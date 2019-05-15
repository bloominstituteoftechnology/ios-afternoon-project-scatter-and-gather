//
//  ViewController.swift
//  Scatter+Gather
//
//  Created by Lisa Sampson on 5/15/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties and Outlets
    var shouldScramble: Bool = false
    let colorArray = [UIColor.red, UIColor.orange, UIColor.blue, UIColor.cyan, UIColor.purple, UIColor.green, UIColor.magenta, UIColor.yellow]
    private var labels: [UILabel] = []
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lambdaL: UILabel!
    @IBOutlet weak var lambdaA: UILabel!
    @IBOutlet weak var lambdaM: UILabel!
    @IBOutlet weak var lambdaB: UILabel!
    @IBOutlet weak var lambdaD: UILabel!
    @IBOutlet weak var lambdA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func toggle(_ sender: Any) {
        
    }
    
}

