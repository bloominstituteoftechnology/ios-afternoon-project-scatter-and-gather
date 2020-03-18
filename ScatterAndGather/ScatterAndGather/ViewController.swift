//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Karen Rodriguez on 3/17/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var l = UILabel(), a = UILabel(), m = UILabel(), b = UILabel(), d = UILabel(), a2 = UILabel()
    
    @IBOutlet weak var l: UILabel!
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var d: UILabel!
    @IBOutlet weak var a2: UILabel!
    
    
    let uiImage = UIImageView(image: UIImage(named: "lambda_logo"))

    var isScattered: Bool = false {
        didSet {
            scatter()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpLabels()
    }

    private func setUpLabels() {
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uiImage)
        uiImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            uiImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            uiImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            uiImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            
            
        ])
        
        
    }
    
    func scatter() {
        
        // MARK: - Random Location computed properties
        let randomX = {
            CGFloat(Int.random(in: 30...Int(self.view.bounds.size.width)-60))
        }
        let randomY = {
            CGFloat(Int.random(in: 100...Int(self.view.bounds.size.height)-200))
        }
        
        // MARK: - Random Color computed properties
        let randomTextColor = {
            UIColor(red: .random(in: 0.15...0.95), green: .random(in: 0.15...0.95), blue: .random(in: 0.15...0.95), alpha: 1.0)
        }
        
        let randomBgColor = {
            CGColor(srgbRed: .random(in: 0.05...0.85), green: .random(in: 0.05...0.85), blue: .random(in: 0.05...0.85), alpha: 1.0)
        }
        
        // MARK: - Random Angle computed property
        let randomAngle = {
            CGFloat.pi / CGFloat(Int.random(in: 1...4))
        }
        
        // MARK: - Random cgfloat for scale
        let randomScale = {
            CGFloat(Int.random(in: 1...2))
        }
        
        let scatterBlock = {
            
            // MARK: - Fade logo out
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.uiImage.alpha = 0
            }
            
            // MARK: - All animations
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                
                self.l.center = CGPoint(x:  randomX(), y: randomY() )
                self.l.textColor = .some(randomTextColor())
                self.l.layer.backgroundColor = randomBgColor()
                self.l.transform = CGAffineTransform(rotationAngle: randomAngle())
                
                self.a.center = CGPoint(x:  randomX(), y: randomY() )
                self.a.textColor = .some(randomTextColor())
                self.a.layer.backgroundColor = randomBgColor()
                self.a.transform = CGAffineTransform(rotationAngle: randomAngle())
                
                self.m.center = CGPoint(x:  randomX(), y: randomY() )
                self.m.textColor = .some(randomTextColor())
                self.m.layer.backgroundColor = randomBgColor()
                self.m.transform = CGAffineTransform(rotationAngle: randomAngle())
                
                self.b.center = CGPoint(x:  randomX(), y: randomY() )
                self.b.textColor = .some(randomTextColor())
                self.b.layer.backgroundColor = randomBgColor()
                self.b.transform = CGAffineTransform(rotationAngle: randomAngle())
                
                self.d.center = CGPoint(x:  randomX(), y: randomY() )
                self.d.textColor = .some(randomTextColor())
                self.d.layer.backgroundColor = randomBgColor()
                self.d.transform = CGAffineTransform(rotationAngle: randomAngle())
                
                self.a2.center = CGPoint(x:  randomX(), y: randomY() )
                self.a2.textColor = .some(randomTextColor())
                self.a2.layer.backgroundColor = randomBgColor()
                self.a2.transform = CGAffineTransform(rotationAngle: randomAngle())
                
                
                // MARK: - Come back to this
                
                UIView.animate(withDuration: 3.0,
                               delay: 0,
                               usingSpringWithDamping: 0.3,
                               initialSpringVelocity: 0,
                               options: [],
                               animations: {
                                self.l.transform = self.l.transform.scaledBy(x: randomScale(), y: randomScale())
                                self.a.transform = self.a.transform.scaledBy(x: randomScale(), y: randomScale())
                                self.m.transform = self.m.transform.scaledBy(x: randomScale(), y: randomScale())
                                self.b.transform = self.b.transform.scaledBy(x: randomScale(), y: randomScale())
                                self.a2.transform = self.a2.transform.scaledBy(x: randomScale(), y: randomScale())
                                
                }, completion: nil)
            }
        }
        
        let andGather = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.uiImage.alpha = 1
                
                self.l.transform = .identity
                self.l.center = CGPoint(x: 89, y: 119)
                self.l.textColor = .black
                self.l.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                
                self.a.transform = .identity
                self.a.center = CGPoint(x: 129, y: 119)
                self.a.textColor = .black
                self.a.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                
                self.m.transform = .identity
                self.m.center = CGPoint(x: 166, y: 119)
                self.m.textColor = .black
                self.m.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                
                self.b.transform = .identity
                self.b.center = CGPoint(x: 221, y: 119)
                self.b.textColor = .black
                self.b.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                
                self.d.transform = .identity
                self.d.center = CGPoint(x: 258, y: 119)
                self.d.textColor = .black
                self.d.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                
                self.a2.transform = .identity
                self.a2.center = CGPoint(x: 296, y: 119)
                self.a2.textColor = .black
                self.a2.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
            }
            
        }
        
        if isScattered {
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: scatterBlock, completion: nil)
        } else {
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: andGather, completion: nil)
        }
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
    
    
}

