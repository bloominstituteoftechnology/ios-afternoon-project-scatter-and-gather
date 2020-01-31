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
            let minX = view.safeAreaInsets.left + (letterFontSize / 2)
            let maxX = minX + view.safeAreaLayoutGuide.layoutFrame.width - (letterFontSize)
            let minY = view.safeAreaInsets.top + (letterFontSize / 2)
            let maxY = minY + view.safeAreaLayoutGuide.layoutFrame.height - (letterFontSize)
            
            let randomPoint = CGPoint(x: .random(in: minX...maxX), y: .random(in: minY...maxY))
            let randomRotationAngle = CGFloat.random(in: -(CGFloat.pi - 0.001)...(CGFloat.pi - 0.001))
            let randomTextColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 0.5)
            let randomBackgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 0.5)
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
                self.letterLabels[index].center = randomPoint
                self.letterLabels[index].transform = CGAffineTransform(rotationAngle: randomRotationAngle)
                self.letterLabels[index].textColor = randomTextColor
                self.letterLabels[index].layer.backgroundColor = randomBackgroundColor.cgColor
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
                self.letterLabels[index].transform = .identity
                self.letterLabels[index].textColor = .black
                self.letterLabels[index].layer.backgroundColor = UIColor.clear.cgColor
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
