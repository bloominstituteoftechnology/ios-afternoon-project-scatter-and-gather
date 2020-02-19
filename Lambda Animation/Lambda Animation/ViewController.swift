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
    
    fileprivate(set) var isScattered = true
    private var lambdaStackView : UIView!
    private var lambdaImageView: UIImageView!
    private var lambdaCharacters = [UILabel]()
 
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        configureNavBar()
        
              
    }
    

    
    // MARK: - Methods
    
    fileprivate func configureNavBar() {
          title = "Lambda Hello"
          navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
    }
    
    @objc func toggleButtonPressed() {
       
      
        let scatterAnimationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.lambdaImageView.alpha = 0
                
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
               
                self.lambdaCharacters.forEach { (label) in
                    label.backgroundColor = .randomColor
                    label.textColor = .randomColor
                    label.transform = CGAffineTransform(scaleX: CGFloat(Double.random(in: 0...2.50)), y: CGFloat(Double.random(in: 0...2.5)))
                    
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                self.lambdaCharacters.forEach { (label) in
                    label.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...250), y: CGFloat.random(in: 0...660)).rotated(by: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
                    label.backgroundColor = .randomColor
                    label.textColor = .randomColor
                }
            }
          
        }
  
        let gatherAnimationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                
                self.lambdaCharacters.forEach { (label) in
                   label.backgroundColor = .clear
                   label.textColor = .black
                    label.transform = .identity
                    
                }
            }
            
            self.lambdaImageView.alpha = 1
        }
            
        
        if isScattered {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: scatterAnimationBlock, completion: nil)
            isScattered = false
        } else {
            isScattered = true
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: gatherAnimationBlock, completion: nil)
        }
    }

    fileprivate func createLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Noteworthy-Bold", size: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    fileprivate func setUpSubviews() {
        
        let l = createLabel(with: "L")
        let a = createLabel(with: "a")
        let m = createLabel(with: "m")
        let b = createLabel(with: "b")
        let d = createLabel(with: "d")
        let a2 = createLabel(with: "a")
        
        
        view.addSubview(l)
        view.addSubview(a)
        view.addSubview(m)
        view.addSubview(b)
        view.addSubview(d)
        view.addSubview(a2)
        
        self.lambdaCharacters.append(l)
        self.lambdaCharacters.append(a)
        self.lambdaCharacters.append(m)
        self.lambdaCharacters.append(b)
        self.lambdaCharacters.append(d)
        self.lambdaCharacters.append(a2)
     
        let lambdaStackView : UIStackView = {
            let stackView = UIStackView()
            for view in lambdaCharacters {
                stackView.addArrangedSubview(view)
            }
            stackView.alignment = .fill
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        view.addSubview(lambdaStackView)
        self.lambdaStackView = lambdaStackView
        
        //MARK: - Constraint stackview
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
        
        //MARK: - Constraint image
        NSLayoutConstraint.activate([
            lambdaImageView.topAnchor.constraint(equalTo: lambdaStackView.bottomAnchor, constant: 20),
            lambdaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lambdaImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lambdaImageView.heightAnchor.constraint(equalToConstant: 200)

        ])
    
    }

}
//MARK: - Extension random color
private extension UIColor {
    static var randomColor: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
