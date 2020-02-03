//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by David Wright on 1/30/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - CONSTANTS
    
    let word: String = "Lambda"
    let letterFontSize: CGFloat = 60
    let spaceBetweenLetters: CGFloat = 14
    let animationDuration: Double = 2
    
    // MARK: - Properties
    
    var leadingOffset: CGFloat = 0
    var originalCenterPoints: [CGPoint] = []
    var isScattered: Bool = false
    
    var letterLabels: [UILabel]! = []
    var lambdaLogoImageView: UIImageView!
    
    // MARK: - Actions
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            gather()
        } else {
            scatter()
        }
        
        isScattered.toggle()
    }
    
    private func scatter() {
        for index in 0..<letterLabels.count {
            // Set bounds for letter label's new center position
            let letterLabelCenterBounds = CGRect(x: view.safeAreaInsets.left + (letterFontSize / 2),
                                           y: view.safeAreaInsets.top + (letterFontSize / 2),
                                           width: view.safeAreaLayoutGuide.layoutFrame.width - (letterFontSize),
                                           height: view.safeAreaLayoutGuide.layoutFrame.height - (letterFontSize))

            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
                self.letterLabels[index].center = CGPoint.random(in: letterLabelCenterBounds)
                self.letterLabels[index].textColor = UIColor.random(withAlpha: 0.5)
                self.letterLabels[index].layer.backgroundColor = UIColor.random(withAlpha: 0.5).cgColor
                //self.letterLabels[index].transform = CGAffineTransform(rotationAngle: CGFloat.randomRadian())
                
                let xyRotation = CATransform3DConcat(CATransform3DMakeRotation(CGFloat.randomRadian(), 1, 0, 0),
                                                     CATransform3DMakeRotation(CGFloat.randomRadian(), 0, 1, 0))
                let xyzRotation = CATransform3DConcat(xyRotation,
                                                      CATransform3DMakeRotation(CGFloat.randomRadian(), 0, 0, 1))
                self.letterLabels[index].layer.transform = xyzRotation
                
            }, completion: nil)
        }
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
            self.lambdaLogoImageView.alpha = 0
        }, completion: nil)
    }
    
    private func gather() {
        for index in 0..<letterLabels.count {
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
                self.letterLabels[index].center = self.originalCenterPoints[index]
                self.letterLabels[index].textColor = .black
                self.letterLabels[index].layer.backgroundColor = UIColor.clear.cgColor
                self.letterLabels[index].transform = .identity
            }, completion: nil)
        }
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
            self.lambdaLogoImageView.alpha = 1
        }, completion: nil)
    }
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLetterLabels()
        configureImageView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setInitialLabelPositions()
    }
    
    // MARK: - Private Methods
    
    private func configureLetterLabels() {
        let font = UIFont(name: "Courier", size: letterFontSize) ?? UIFont.monospacedSystemFont(ofSize: letterFontSize, weight: .regular)
        
        for letter in word {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = String(letter)
            label.textAlignment = .center
            label.font = font
            
            view.addSubview(label)
            letterLabels.append(label)
        }
    }
    
    private func setInitialLabelPositions() {
        let widthOfAllLabels: CGFloat = letterLabels.map { $0.bounds.size.width }.reduce(0, +)
        let widthOfAllLabelsIncludingSpaces = widthOfAllLabels + (spaceBetweenLetters * CGFloat(letterLabels.count - 1))
        leadingOffset = (view.safeAreaLayoutGuide.layoutFrame.width - widthOfAllLabelsIncludingSpaces) / 2
        
        let centerY: CGFloat = (letterFontSize / 2) + view.safeAreaInsets.top + 20
        var centerX: CGFloat = leadingOffset
        
        for index in letterLabels.indices {
            if index == 0 {
                centerX += (letterLabels[index].bounds.size.width / 2)
            } else {
                centerX += ((letterLabels[index].bounds.size.width + letterLabels[index - 1].bounds.size.width) / 2 + spaceBetweenLetters)
            }
            
            let labelCenterPoint = CGPoint(x: centerX, y: centerY)
            letterLabels[index].center = labelCenterPoint
            originalCenterPoints.append(labelCenterPoint)
        }
    }
    
    private func configureImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: letterFontSize + 50) ,
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5)
        ])
        
        lambdaLogoImageView = imageView
    }
    
}

extension Character {
    func width(usingFont font: UIFont) -> CGFloat {
        return String(self).size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}

extension UIColor {
    static func random(withAlpha alpha: CGFloat? = nil) -> UIColor {
        let alpha = alpha ?? 1.0
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: alpha)
    }
}

extension CGPoint {
    static func random(in rect: CGRect) -> CGPoint {
        return CGPoint(x: .random(in: rect.minX...rect.maxX), y: .random(in: rect.minY...rect.maxY))
    }
}

extension CGFloat {
    static func randomRadian() -> CGFloat {
        return CGFloat.random(in: -(CGFloat.pi)...(CGFloat.pi - 0.001))
    }
}
