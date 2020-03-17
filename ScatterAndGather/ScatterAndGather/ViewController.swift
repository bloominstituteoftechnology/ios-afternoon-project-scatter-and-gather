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
        let animationBlock = {
            print("\(self.view.bounds)")
            
            // MARK: - Random Location computed properties
            let randomX = {
                CGFloat(Int.random(in: 30...Int(self.view.bounds.size.width)-60))
            }
            let randomY = {
                CGFloat(Int.random(in: 50...Int(self.view.bounds.size.height)-200))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.uiImage.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.l.center = CGPoint(x:  randomX(), y: randomY() )
                print("L: \(self.l.center)")
                
               self.a.center = CGPoint(x:  randomX(), y: randomY() )
                print(self.a.center)
                
                self.m.center = CGPoint(x:  randomX(), y: randomY() )
                print(self.a.center)
                
                self.b.center = CGPoint(x:  randomX(), y: randomY() )
                print(self.a.center)
                
                self.d.center = CGPoint(x:  randomX(), y: randomY() )
                print(self.a.center)
                
                self.a2.center = CGPoint(x:  randomX(), y: randomY() )
                print(self.a.center)
            }
        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animationBlock, completion: nil)
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
    
    
}

