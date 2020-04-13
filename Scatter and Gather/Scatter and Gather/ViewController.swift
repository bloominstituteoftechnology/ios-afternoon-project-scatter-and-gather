//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Breena Greek on 4/10/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    var stackView: UIStackView!
    var lLetter: UILabel!
    var aLetter: UILabel!
    var mLetter: UILabel!
    var bLetter: UILabel!
    var dLetter: UILabel!
    var a2Letter: UILabel!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        
        // Letters
        lLetter = UILabel()
        lLetter.translatesAutoresizingMaskIntoConstraints = false
        lLetter.text = "L"
        lLetter.textAlignment = .center
        lLetter.font = UIFont.systemFont(ofSize: 40)
        lLetter.widthAnchor.constraint(equalTo: lLetter.heightAnchor).isActive = true
        
        aLetter = UILabel()
        aLetter.translatesAutoresizingMaskIntoConstraints = false
        aLetter.text = "A"
        aLetter.textAlignment = .center
        aLetter.font = UIFont.systemFont(ofSize: 40)
        aLetter.widthAnchor.constraint(equalTo: aLetter.heightAnchor).isActive = true
        
        mLetter = UILabel()
        mLetter.translatesAutoresizingMaskIntoConstraints = false
        mLetter.text = "M"
        mLetter.textAlignment = .center
        mLetter.font = UIFont.systemFont(ofSize: 40)
        mLetter.widthAnchor.constraint(equalTo: mLetter.heightAnchor).isActive = true
        
        bLetter = UILabel()
        bLetter.translatesAutoresizingMaskIntoConstraints = false
        bLetter.text = "B"
        bLetter.textAlignment = .center
        bLetter.font = UIFont.systemFont(ofSize: 40)
        bLetter.widthAnchor.constraint(equalTo: bLetter.heightAnchor).isActive = true
        
        dLetter = UILabel()
        dLetter.translatesAutoresizingMaskIntoConstraints = false
        dLetter.text = "D"
        dLetter.textAlignment = .center
        dLetter.font = UIFont.systemFont(ofSize: 40)
        dLetter.widthAnchor.constraint(equalTo: dLetter.heightAnchor).isActive = true
        
        a2Letter = UILabel()
        a2Letter.translatesAutoresizingMaskIntoConstraints = false
        a2Letter.text = "A"
        a2Letter.textAlignment = .center
        a2Letter.font = UIFont.systemFont(ofSize: 40)
        a2Letter.widthAnchor.constraint(equalTo: a2Letter.heightAnchor).isActive = true
        
        // Lambda Image
        imageView = UIImageView(image: UIImage(named: "lambda_logo")!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // StackView
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(lLetter)
        stackView.addArrangedSubview(aLetter)
        stackView.addArrangedSubview(mLetter)
        stackView.addArrangedSubview(bLetter)
        stackView.addArrangedSubview(dLetter)
        stackView.addArrangedSubview(a2Letter)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        // Toggle Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toggleButtonPressed(_:)))
    }
    
    @objc func toggleButtonPressed(_: UIBarButtonItem) {
        isScattered.toggle()
        if navigationItem.rightBarButtonItem!.isEnabled {
            if isScattered == true {
                let letters = [self.lLetter, self.aLetter, self.mLetter, self.bLetter, self.dLetter, self.a2Letter]
                UIView.animate(withDuration: 5.0, delay: 0, options: [], animations: {
                    
                    let width = self.view.bounds.width - 400
                    let height = self.view.bounds.height - 400
                    let fallL = CGAffineTransform(translationX: CGFloat.random(in: 1...width),
                                                  y: CGFloat.random(in: 1...height))
                    let fallA = CGAffineTransform(translationX: CGFloat.random(in: 1...width),
                                                  y: CGFloat.random(in: 1...height))
                    let fallM = CGAffineTransform(translationX: CGFloat.random(in: 1...width),
                                                  y: CGFloat.random(in: 1...height))
                    let fallB = CGAffineTransform(translationX: CGFloat.random(in: 1...width),
                                                  y: CGFloat.random(in: 1...height))
                    let fallD = CGAffineTransform(translationX: CGFloat.random(in: 1...width),
                                                  y: CGFloat.random(in: 1...height))
                    let fallA2 = CGAffineTransform(translationX: CGFloat.random(in: 1...width),
                                                   y: CGFloat.random(in: 1...height))
                    
                    let rotateL = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...10))
                    let rotateA = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...10))
                    let rotateM = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...10))
                    let rotateB = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...10))
                    let rotateD = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...10))
                    let rotateA2 = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...10))
                    
                    self.lLetter.transform = rotateL.concatenating(fallL)
                    self.aLetter.transform = rotateA.concatenating(fallA)
                    self.mLetter.transform = rotateM.concatenating(fallM)
                    self.bLetter.transform = rotateB.concatenating(fallB)
                    self.dLetter.transform = rotateD.concatenating(fallD)
                    self.a2Letter.transform = rotateA2.concatenating(fallA2)
                    
                    for i in letters {
                        i?.layer.backgroundColor = UIColor.randomColor().cgColor
                        i?.textColor = UIColor.randomColor()
                    }
                    
                    self.imageView.alpha = 0.0
                    
                }, completion: nil)
                
            } else {
                if isScattered == false {
                    UIView.animate(withDuration: 5.0, delay: 0, options: [], animations: {
                        let letters = [self.lLetter, self.aLetter, self.mLetter, self.bLetter, self.dLetter, self.a2Letter]
                        
                        for i in letters {
                            i?.transform = .identity
                            i?.layer.backgroundColor = UIColor.clear.cgColor
                            i?.textColor = .black
                        }
                        self.imageView.alpha = 1.0
                        
                    }, completion: nil)
                }
            }
        }
    }
}

func randomCGFloat() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)}

extension UIColor {
    static func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
