//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Lambda_School_Loaner_259 on 3/17/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered = Bool()
    let stackView = UIStackView()
    let imageView = UIImageView()
    let l = UILabel()
    let a = UILabel()
    let m = UILabel()
    let b = UILabel()
    let d = UILabel()
    let a2 = UILabel()
    var centerDict: [ String : CGPoint] = [:]

    // MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        //bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scatter", style: .plain, target: self, action: #selector(toggleButtonPressed))
        
        // Set tranlate to false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        l.translatesAutoresizingMaskIntoConstraints = false
        a.translatesAutoresizingMaskIntoConstraints = false
        m.translatesAutoresizingMaskIntoConstraints = false
        b.translatesAutoresizingMaskIntoConstraints = false
        d.translatesAutoresizingMaskIntoConstraints = false
        a2.translatesAutoresizingMaskIntoConstraints = false
        
        // Add to view
        view.addSubview(stackView)
        view.addSubview(imageView)
        
        // StackView settings
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(l)
        stackView.addArrangedSubview(a)
        stackView.addArrangedSubview(m)
        stackView.addArrangedSubview(b)
        stackView.addArrangedSubview(d)
        stackView.addArrangedSubview(a2)
        
        // Labels text
        l.text = "L"
        a.text = "a"
        m.text = "m"
        b.text = "b"
        d.text = "d"
        a2.text = "a"
        
        // ImageView constraints & image
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.safeAreaLayoutGuide.layoutFrame.height / 4),
            imageView.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width / 2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.25)
        ])
        imageView.image = UIImage(named: "lambda_logo")
        
        
        // StackView Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        // Labels Points
//        for label in [l, a, m, b, d, a2] {
//            guard let key = label.text else { return }
//            //centerDict["\(key)"] = label.cen
//        }
    }
    
    
    // MARK: - private methods
    @objc func toggleButtonPressed() {
        if isScattered == false {
            UIView.animate(withDuration: 4.0) {
                self.imageView.alpha = 0.0
            }
            
            let width = Int(view.frame.size.width)/2 - 30
            let height = Int(view.frame.size.height)/2 - 40
            
            for label in [l, a, m, b, d, a2] {
                let randX = Int.random(in: -width...width)
                let randY = Int.random(in: -(height-50)...height)
                let rotationAngle = Int.random(in: Int(-2 * CGFloat.pi)...Int(2 * CGFloat.pi))
                UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.center = CGPoint(x: randX, y: randY)
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.backgroundColor = self.getRandomColor()
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.textColor = self.getRandomColor()
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.transform = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
                    }
                })
            }
            navigationItem.rightBarButtonItem?.title = "Gather"
            isScattered = true
        } else {
            UIView.animate(withDuration: 4.0) {
                self.imageView.alpha = 1.0
            }
            let y = 10.166666667
            UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.l.center = CGPoint(x: 4.666666667, y: y)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.a.center = CGPoint(x: 13.833333333, y: y)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.m.center = CGPoint(x: 25.666666667, y: y)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.b.center = CGPoint(x: 38.166666667, y: y)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.d.center = CGPoint(x: 48.500000000, y: y)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.a2.center = CGPoint(x: 58.166666667, y: y)
                }
            })
            for label in [l, a, m, b, d, a2] {
                UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.backgroundColor = .clear
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.textColor = .black
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                        label.transform = .identity
                    }
                })
            }
            navigationItem.rightBarButtonItem?.title = "Scatter"
            isScattered = false
        }
    }
    
    func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)

        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
}


//@propertyWrapper struct AutoLayoutFalse {
//    var wrappedValue: UIView {
//        didSet { wrappedValue.translatesAutoresizingMaskIntoConstraints = false }
//    }
//
//    init(wrappedValue: UIView) {
//        self.wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//    }
//}
