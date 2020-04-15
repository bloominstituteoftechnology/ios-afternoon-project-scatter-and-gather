//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Harmony Radley on 4/14/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class LambdaViewController: UIViewController {

    var isScattered: Bool = false
    
 
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        fadeLogo()
        lettersRandom()
        
        
        
        
        
    }
    
    // I don't know where to find the information on fading something..
    // alpha 1.0 - 0.0 ( fade out )
    private func fadeLogo() {
        UIView.animate(withDuration: 4.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.imageView.alpha = 0.0
        }, completion: nil)
        
        // addSubview(imageView)
    }
    
    // off set ?
    // random. Don't know how to make them random.
    // Trying to access transform to make random postion.
    // confused on how to do this even after reading the Int API
    // cast the Int? as? Int.self as? CGFloat
    
    // If I set constraints in storyboard... random locations?
    private func lettersRandom() {
  
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelL.transform = CGAffineTransform(translationX: 0, y: 20)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelA.transform = CGAffineTransform(translationX: 10, y: 40)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelM.transform = CGAffineTransform(translationX: 50, y: 100)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelD.transform = CGAffineTransform(translationX: 45, y: 60)
            }
            
            
            
            
            
        }, completion: nil)
        // array of labels
        //
}

}
//rgb 0 - 255
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
