//
//  ViewController.swift
//  Lambda Animation
//
//  Created by Nick Nguyen on 2/18/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Properties
    
     var isScattered = true
    private var lambdaStackView : UIView!
    private var lambdaImageView: UIImageView!
    private var l : UILabel!
    private var a : UILabel!
    private var m : UILabel!
    private var b : UILabel!
    private var d : UILabel!
    private var a2 : UILabel!
   
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        configureNavBar()
        
    }
    
    
    
    
    fileprivate func configureNavBar() {
          title = "Lambda Hello"
          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
    }
    
    @objc func toggleButtonPressed() {
        let lambdaCharacters : [UILabel] = [l,a,m,b,d,a2]
       
        let scatterAnimationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.lambdaImageView.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
               
                lambdaCharacters.forEach { (label) in
                    label.backgroundColor = .randomColor
                    label.textColor = .randomColor
                    label.transform = CGAffineTransform(scaleX: CGFloat(Double.random(in: 0...2.50)), y: CGFloat(Double.random(in: 0...2.5)))
                    
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                lambdaCharacters.forEach { (label) in
                  
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat(Int.random(in: 0...18)))
                    label.center = CGPoint(x: CGFloat(Int.random(in: 0 ... Int(self.view.bounds.maxX))), y: CGFloat(Int.random(in: 0 ... Int(self.view.bounds.maxY + 50))))
                }
            }
          
        }
     
        let gatherAnimationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.lambdaImageView.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
                lambdaCharacters.forEach { (label) in
                    label.center = CGPoint(x: 2, y: 4)
                    label.backgroundColor = .clear
                    label.textColor = .black
                }
            }
        }
        
        
        if isScattered {
            UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: scatterAnimationBlock, completion: nil)
            isScattered = false
        } else {
            isScattered = true
            UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: gatherAnimationBlock, completion: nil)
        }
    }

    
    fileprivate func setUpSubviews() {
        
        let l : UILabel = {
           let label = UILabel()
            label.text = "L"
            label.font = UIFont(name: "Noteworthy-Bold", size: 40)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(l)
        self.l = l
        let a : UILabel = {
               let label = UILabel()
                label.text = "a"
                label.font = UIFont(name: "Noteworthy-Bold", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        
        view.addSubview(a)
        self.a = a
        let m : UILabel = {
               let label = UILabel()
                label.text = "m"
                label.font = UIFont(name: "Noteworthy-Bold", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(m)
        self.m = m
        let b : UILabel = {
               let label = UILabel()
                label.text = "b"
                label.font = UIFont(name: "Noteworthy-Bold", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(b)
        self.b = b
        
        let d : UILabel = {
               let label = UILabel()
                label.text = "d"
                label.font = UIFont(name: "Noteworthy-Bold", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(d)
        self.d = d
        
        let a2 : UILabel = {
               let label = UILabel()
                label.text = "a"
                label.font = UIFont(name: "Noteworthy-Bold", size: 40)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
        view.addSubview(a2)
        self.a2 = a2
     
        let lambdaStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(l)
            stackView.addArrangedSubview(a)
            stackView.addArrangedSubview(m)
            stackView.addArrangedSubview(b)
            stackView.addArrangedSubview(d)
            stackView.addArrangedSubview(a2)
            stackView.alignment = .fill
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        view.addSubview(lambdaStackView)
        self.lambdaStackView = lambdaStackView
        NSLayoutConstraint.activate([
            lambdaStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lambdaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lambdaStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lambdaStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
     
        ])
       
        
        let lambdaImageView: UIImageView = {
           let imageView = UIImageView(image: #imageLiteral(resourceName: "lambda_logo"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
            
        }()
        
        view.addSubview(lambdaImageView)
        self.lambdaImageView = lambdaImageView
        NSLayoutConstraint.activate([
            lambdaImageView.topAnchor.constraint(equalTo: lambdaStackView.bottomAnchor, constant: 20),
            lambdaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lambdaImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lambdaImageView.heightAnchor.constraint(equalToConstant: 200)

        ])
    
    }

}

extension UIColor {
    static var randomColor: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
