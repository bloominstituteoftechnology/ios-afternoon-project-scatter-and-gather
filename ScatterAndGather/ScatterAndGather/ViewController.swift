//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Craig Swanson on 11/14/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    var isScattered: Bool = false
    
    
    // MARK: Outlets
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    @IBOutlet weak var lambaLogo: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func togglebuttonPressed(_ sender: UIBarButtonItem) {
    }
    


}

