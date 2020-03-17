//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Karen Rodriguez on 3/17/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var l = UILabel(), a = UILabel(), m = UILabel(), b = UILabel(), d = UILabel(), a2 = UILabel()
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
        l.text = "L"
        l.font = UIFont.boldSystemFont(ofSize: 40)
        
        a.text = "a"
        a.font = UIFont.boldSystemFont(ofSize: 40)
        
        m.text = "m"
        m.font = UIFont.boldSystemFont(ofSize: 40)
        
        b.text = "b"
        b.font = UIFont.boldSystemFont(ofSize: 40)
        
        d.text = "d"
        d.font = UIFont.boldSystemFont(ofSize: 40)
        
        a2.text = "a"
        a2.font = UIFont.boldSystemFont(ofSize: 40)
        
        l.translatesAutoresizingMaskIntoConstraints = false
        a.translatesAutoresizingMaskIntoConstraints = false
        m.translatesAutoresizingMaskIntoConstraints = false
        b.translatesAutoresizingMaskIntoConstraints = false
        d.translatesAutoresizingMaskIntoConstraints = false
        a2.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        
        stackView.addArrangedSubview(l)
        stackView.addArrangedSubview(a)
        stackView.addArrangedSubview(m)
        stackView.addArrangedSubview(b)
        stackView.addArrangedSubview(d)
        stackView.addArrangedSubview(a2)
        
        
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uiImage)
        uiImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
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
            CGFloat(Int.random(in: 50...Int(self.view.bounds.size.height)-200))
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
        
        let animationBlock = {
            
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
                
                
            }
        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animationBlock, completion: nil)
    }

    func andGather() {
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
    
    
}

