//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Jon Bash on 2019-11-05.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var logoHorizontalInset: CGFloat = 40
    private var logoInsets = CGSize(width: 40, height: 100)
    
    private var isScattered: Bool = false
    
    private var letterLabelsToScatter = [UILabel]()
    private var lambdaLetterConstraints = [NSLayoutConstraint]()
    
    private var logoImageView = UIImageView()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLambdaLogo()
        setUpLettersToScatter()
    }
    
    // MARK: - Subview Setup
    
    private func setUpLambdaLogo() {
        logoImageView = UIImageView(image: UIImage(named: "lambdaLogo"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: logoInsets.width),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -logoInsets.width),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: logoInsets.height),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 2000 / 558)
        ])
    }
    
    private func setUpLettersToScatter() {
        let wordToScatter = "Lambda"
        let wordInset = CGSize(width: 40, height: 60)
        let letterSpacing: CGFloat = 2
        
        let lettersToScatter = Array(wordToScatter)
        let screenWidth = view.bounds.width
        let letterWidth = ((screenWidth - (2 * wordInset.width)) / CGFloat(wordToScatter.count)) - letterSpacing
        let letterHeight = wordInset.height * 2
        
        var letterLabels = [UILabel]()
        
        // set up each letter's label individually
        
        for letterIndex in 0 ..< wordToScatter.count {
            let letterLabel = UILabel(frame: CGRect(
                x: 0, y: 0, width: letterWidth, height: letterHeight
            ))
            letterLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(letterLabel)
            
            // set up label text
            
            letterLabel.font = UIFont.monospacedSystemFont(ofSize: 200, weight: .bold)
            letterLabel.adjustsFontSizeToFitWidth = true
            letterLabel.minimumScaleFactor = 0.05
            letterLabel.textAlignment = .center
            letterLabel.baselineAdjustment = .alignCenters
            
            letterLabel.text = String(lettersToScatter[letterIndex])
            
            // possibly not needed?
            // letterLabel.center = CGPoint(
            //     x: wordInset.width + (letterWidth * 0.5) + (CGFloat(letterIndex) * (letterWidth + letterSpacing)),
            //     y: wordInset.height
            // )
            
            // set up letter label's constraints
            
            let widthConstraint = letterLabel.widthAnchor.constraint(equalToConstant: letterWidth)
            widthConstraint.priority -= 1
            let heightConstraint = letterLabel.heightAnchor.constraint(equalToConstant: letterHeight)
            heightConstraint.priority -= 1
            NSLayoutConstraint.activate([
                widthConstraint,
                heightConstraint
            ])
            
            let leadingConstraint: NSLayoutConstraint
            if letterIndex == 0 {
                leadingConstraint = letterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: wordInset.width)
            } else {
                leadingConstraint = letterLabel.leadingAnchor.constraint(equalTo: letterLabels[letterIndex - 1].trailingAnchor, constant: letterSpacing)
            }
            
            var trailingConstraint: NSLayoutConstraint? = nil
            if letterIndex == wordToScatter.count - 1 {
                trailingConstraint = letterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -wordInset.width)
            }
            
            var constraintsForThisLetter = [
                leadingConstraint,
                letterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: letterSpacing),
                letterLabel.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: letterSpacing)
            ]
            if let trailingConstraint = trailingConstraint {
                constraintsForThisLetter.append(trailingConstraint)
            }
            
            lambdaLetterConstraints.append(contentsOf: constraintsForThisLetter)
            
            letterLabels.append(letterLabel)
        }
        NSLayoutConstraint.activate(lambdaLetterConstraints)
        
        self.letterLabelsToScatter = letterLabels
    }
    
    // MARK: - IB Actions

    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        if isScattered { gather() } else { scatter() }
    }
    
    // MARK: - Animations
    
    private func scatter() {
        
    }
    
    private func gather() {
        
    }
}

