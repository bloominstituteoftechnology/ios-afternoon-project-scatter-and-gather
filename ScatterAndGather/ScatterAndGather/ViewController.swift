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
        NSLayoutConstraint.deactivate(labelConstraints)
        
        if isScattered {
            // return things to normal
            
            UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [], animations: {
                // fade in logo
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                    self.imgLogo.alpha = 1.0
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    // rotate back and move back
                    self.lblL.transform = .identity
                    self.lblA1.transform = .identity
                    self.lblM.transform = .identity
                    self.lblB.transform = .identity
                    self.lblD.transform = .identity
                    self.lblA2.transform = .identity
                    
                    // remove background colors
                    self.lblL.layer.backgroundColor = UIColor.white.cgColor
                    self.lblA1.layer.backgroundColor = UIColor.white.cgColor
                    self.lblM.layer.backgroundColor = UIColor.white.cgColor
                    self.lblB.layer.backgroundColor = UIColor.white.cgColor
                    self.lblD.layer.backgroundColor = UIColor.white.cgColor
                    self.lblA2.layer.backgroundColor = UIColor.white.cgColor
                }
            }, completion: nil)
            
            
            
            
        } else {
            // fade and scatter
            
            UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [], animations: {
                // fade out logo
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                    self.imgLogo.alpha = 0.0
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    // rotate
                    self.lblL.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -180...180) * CGFloat.pi / 180)
                    self.lblA1.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -180...180) * CGFloat.pi / 180)
                    self.lblM.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -180...180) * CGFloat.pi / 180)
                    self.lblB.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -180...180) * CGFloat.pi / 180)
                    self.lblD.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -180...180) * CGFloat.pi / 180)
                    self.lblA2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -180...180) * CGFloat.pi / 180)
                    
                    // background colors
                    self.lblL.layer.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255,
                                               green: CGFloat.random(in: 1...255)/255,
                                               blue: CGFloat.random(in: 1...255)/255,
                                               alpha: 1.0).cgColor
                    self.lblA1.layer.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255,
                                                              green: CGFloat.random(in: 1...255)/255,
                                                              blue: CGFloat.random(in: 1...255)/255,
                                                              alpha: 1.0).cgColor
                    self.lblM.layer.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255,
                                                              green: CGFloat.random(in: 1...255)/255,
                                                              blue: CGFloat.random(in: 1...255)/255,
                                                              alpha: 1.0).cgColor
                    self.lblB.layer.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255,
                                                              green: CGFloat.random(in: 1...255)/255,
                                                              blue: CGFloat.random(in: 1...255)/255,
                                                              alpha: 1.0).cgColor
                    self.lblD.layer.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255,
                                                              green: CGFloat.random(in: 1...255)/255,
                                                              blue: CGFloat.random(in: 1...255)/255,
                                                              alpha: 1.0).cgColor
                    self.lblA2.layer.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255,
                                                              green: CGFloat.random(in: 1...255)/255,
                                                              blue: CGFloat.random(in: 1...255)/255,
                                                              alpha: 1.0).cgColor
                    
                    // position
                    let x0 = self.view.safeAreaInsets.left
                    let x1 = self.view.frame.width - self.view.safeAreaInsets.right
                    let y0 = self.view.safeAreaInsets.top
                    let y1 = self.view.frame.height - self.view.safeAreaInsets.bottom
                    
                    
                    let tlx = CGFloat.random(in: x0...x1) - self.lblL.center.x
                    let tly = CGFloat.random(in: y0...y1) - self.lblL.center.y
                    print("x: \(tlx), y: \(tly)")
                    
//                    self.lblL.transform = self.lblL.transform.translatedBy(x: CGFloat.random(in: x0...x1) - self.lblL.center.x,
//                                                                           y: CGFloat.random(in: y0...y1) - self.lblL.center.y)
                    self.lblL.transform = self.lblL.transform.translatedBy(x: tlx,
                                                                           y: tly)

                    self.lblA1.transform = self.lblL.transform.translatedBy(x: self.lblL.center.x - CGFloat.random(in: x0...x1),
                                                                           y: self.lblL.center.y - CGFloat.random(in: y0...y1))
                    self.lblM.transform = self.lblL.transform.translatedBy(x: CGFloat.random(in: x0...x1) - self.lblL.center.x,
                                                                           y: CGFloat.random(in: y0...y1) - self.lblL.center.y)
                    self.lblB.transform = self.lblL.transform.translatedBy(x: CGFloat.random(in: x0...x1) - self.lblL.center.x,
                                                                           y: CGFloat.random(in: y0...y1) - self.lblL.center.y)
                    self.lblD.transform = self.lblL.transform.translatedBy(x: CGFloat.random(in: x0...x1) - self.lblL.center.x,
                                                                           y: CGFloat.random(in: y0...y1) - self.lblL.center.y)
                    self.lblA2.transform = self.lblL.transform.translatedBy(x: CGFloat.random(in: x0...x1) - self.lblL.center.x,
                                                                           y: CGFloat.random(in: y0...y1) - self.lblL.center.y)
                }
                
            }, completion: nil)
            
            
            
        }
        isScattered = !isScattered
    }
}

