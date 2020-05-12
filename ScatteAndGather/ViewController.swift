//
//  ViewController.swift
//  ScatteAndGather
//
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var letterLOutlet: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    @IBOutlet weak var letterA2Outlet: UILabel!
    @IBOutlet weak var letterDOutlet: UILabel!
    @IBOutlet weak var letterBOutlet: UILabel!
    @IBOutlet weak var letterMOutlet: UILabel!
    @IBOutlet weak var letterAOulet: UILabel!

    // MARK: - Properties
    var isScattered: Bool = false
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Begin Animations (DUN DUN DUN...)
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        // is it scattered?
        if isScattered {
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.lambdaLogoImageView.alpha = 1.0
                }
                
                //Letters returning characteristics
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2.5) {
                    self.letterLOutlet.frame = CGRect(x: 51, y: 114, width: 40, height: 72)
                    self.letterAOulet.frame = CGRect(x: 101, y: 114, width: 43, height: 72)
                    self.letterMOutlet.frame = CGRect(x: 154, y: 114, width: 50.5, height: 72)
                    self.letterBOutlet.frame = CGRect(x: 214, y: 114, width: 39, height: 72)
                    self.letterDOutlet.frame = CGRect(x: 263, y: 114, width: 47.5, height: 72)
                    self.letterA2Outlet.frame = CGRect(x: 321, y: 114, width: 43, height: 72)
                    
                    self.letterLOutlet.backgroundColor = .white
                    self.letterAOulet.backgroundColor = .white
                    self.letterMOutlet.backgroundColor = .white
                    self.letterBOutlet.backgroundColor = .white
                    self.letterDOutlet.backgroundColor = .white
                    self.letterA2Outlet.backgroundColor = .white
                    
                    self.letterLOutlet.textColor = .black
                    self.letterAOulet.textColor = .black
                    self.letterMOutlet.textColor = .black
                    self.letterBOutlet.textColor = .black
                    self.letterDOutlet.textColor = .black
                    self.letterA2Outlet.textColor = .black
                }
                
            }, completion: nil)
        } else {
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                // Image fades
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.lambdaLogoImageView.alpha = 0.0
                }
                
                // Letter scattering animations
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterLOutlet.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterLOutlet.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                                 green: CGFloat.random(in: 0...255)/255,
                                                                 blue: CGFloat.random(in: 0...255)/255,
                                                                 alpha: 1.0)
                    
                    self.letterLOutlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterLOutlet.frame = CGRect(x: Int.random(in: 100...400),
                                                      y: Int.random(in: 100...800),
                                                      width: Int.random(in: 40...50),
                                                      height: Int.random(in: 40...50))
                }
                // Letter A randomization
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterAOulet.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                          green: CGFloat.random(in: 0...255)/255,
                                                          blue: CGFloat.random(in: 0...255)/255,
                                                          alpha: 1.0)
                    
                    self.letterAOulet.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                                green: CGFloat.random(in: 0...255)/255,
                                                                blue: CGFloat.random(in: 0...255)/255,
                                                                alpha: 1.0)
                    
                    self.letterAOulet.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterAOulet.frame = CGRect(x: Int.random(in: 100...400),
                                                     y: Int.random(in: 100...800),
                                                     width: Int.random(in: 40...50),
                                                     height: Int.random(in: 40...50))
                }
                // Letter M randomization
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterMOutlet.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterMOutlet.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                                 green: CGFloat.random(in: 0...255)/255,
                                                                 blue: CGFloat.random(in: 0...255)/255,
                                                                 alpha: 1.0)
                    
                    self.letterMOutlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterMOutlet.frame = CGRect(x: Int.random(in: 100...400),
                                                      y: Int.random(in: 100...800),
                                                      width: Int.random(in: 40...50),
                                                      height: Int.random(in: 40...50))
                }
                // Letter B randomization
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterBOutlet.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterBOutlet.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                                 green: CGFloat.random(in: 0...255)/255,
                                                                 blue: CGFloat.random(in: 0...255)/255,
                                                                 alpha: 1.0)
                    
                    self.letterBOutlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterBOutlet.frame = CGRect(x: Int.random(in: 100...400),
                                                      y: Int.random(in: 100...800),
                                                      width: Int.random(in: 40...50),
                                                      height: Int.random(in: 40...50))
                }
                // Letter D randomization
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterDOutlet.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterDOutlet.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                                 green: CGFloat.random(in: 0...255)/255,
                                                                 blue: CGFloat.random(in: 0...255)/255,
                                                                 alpha: 1.0)
                    
                    self.letterDOutlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterDOutlet.frame = CGRect(x: Int.random(in: 100...400),
                                                      y: Int.random(in: 100...800),
                                                      width: Int.random(in: 40...50),
                                                      height: Int.random(in: 40...50))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterA2Outlet.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                            green: CGFloat.random(in: 0...255)/255,
                                                            blue: CGFloat.random(in: 0...255)/255,
                                                            alpha: 1.0)
                    
                    self.letterA2Outlet.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                                  green: CGFloat.random(in: 0...255)/255,
                                                                  blue: CGFloat.random(in: 0...255)/255,
                                                                  alpha: 1.0)
                    
                    self.letterA2Outlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterA2Outlet.frame = CGRect(x: Int.random(in: 100...400),
                                                       y: Int.random(in: 100...800),
                                                       width: Int.random(in: 40...50),
                                                       height: Int.random(in: 40...50))
                }
                
            }, completion: nil)
            
        }
        isScattered.toggle()
    }
}
