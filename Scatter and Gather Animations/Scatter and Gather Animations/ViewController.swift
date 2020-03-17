//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Nichole Davidson on 3/17/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
        
    var lLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var aEndLabel = UILabel()
    var imageView = UIImageView()
    
//    var lambdaLogo = UIImage {
//        if UIImage.self != nil {
//            UIImage(named: "lambda_logo")
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubViews()
    }
    
    func setUpSubViews() {
        view.addSubview(lLabel)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        lLabel.text = "L"
        lLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        lLabel.backgroundColor = UIColor(displayP3Red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        
        
        
        
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        var isScattered: Bool = true
        isScattered.toggle()
        
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
