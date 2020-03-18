//
//  ViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Bhawnish Kumar on 3/17/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

enum scatOrGat: String {
       case scattered = "Scattered"
       case gathered = "Gathered"
   }
class ViewController: UIViewController {
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    
    @IBOutlet weak var toggleButtonTapped: UIBarButtonItem!
    
    var isScattered: Bool?
    //MARK: Lambda Image View Property
    @objc let lambdaImageView: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "lambda_logo.png")
       theImageView.translatesAutoresizingMaskIntoConstraints = false 
       return theImageView
    }()
     

    override func viewDidLoad() {
       super.viewDidLoad()
       someImageViewConstraints()
        
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        guard let toggleButton = toggleButtonTapped else { return }
        if (toggleButton.action != nil) == true {
            lambdaImageView.fadeOut(completion: {
                (finished: Bool) -> Void in
                self.lambdaImageView.removeFromSuperview()
            })
        } else if (toggleButton.action != nil) == true {
           lambdaImageView.fadeIn()

    }
    }
//     MARK: Lambda Image View Function
    func someImageViewConstraints() {
           view.addSubview(lambdaImageView)
         lambdaImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
         lambdaImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
         lambdaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         lambdaImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
     }
    



}
extension UIView {

    func fadeIn(_ duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
    }, completion: completion)  }

    func fadeOut(_ duration: TimeInterval = 1.5, delay: TimeInterval = 1.5, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.3
    }, completion: completion)
   }
}


