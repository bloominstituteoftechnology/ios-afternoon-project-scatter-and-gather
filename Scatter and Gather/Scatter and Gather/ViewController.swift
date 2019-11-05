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
    
    private var isScattered: Bool = false
    
    private var lettersToScatter: [UILabel]?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        lettersToScatter = setUpLettersToScatter()
    }
    
    // MARK: - Subview Setup
    
    
    private func setUpLettersToScatter() {
        /*
        let wordToScatter = "Lambda"
        let wordInset = CGSize(width: 40, height: 60)
        let letterSpacing: CGFloat = 2
        
        let lettersToScatter = Array(wordToScatter)
        let screenWidth = view.bounds.width
        let letterWidth = ((screenWidth - (2 * wordInset.width)) / CGFloat(wordToScatter.count)) - letterSpacing
        let letterHeight = wordInset.height * 2
        
        var letterLabels = [UILabel]()
        
        for letterIndex in 0 ..< wordToScatter.count {
            let letterLabel = UILabel(frame: CGRect(
                x: 0, y: 0, width: letterWidth, height: letterHeight
            ))
            letterLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(letterLabel)
            
            letterLabel.font = UIFont.monospacedSystemFont(ofSize: 200, weight: .bold)
            letterLabel.adjustsFontSizeToFitWidth = true
            letterLabel.minimumScaleFactor = 0.05
            letterLabel.textAlignment = .center
            
            NSLayoutConstraint.activate([
                letterLabel.widthAnchor.constraint(equalToConstant: letterWidth),
                letterLabel.heightAnchor.constraint(equalToConstant: letterHeight)
            ])
            
            letterLabel.center = CGPoint(
                x: wordInset.width + (letterWidth * 0.5) + (CGFloat(letterIndex) * (letterWidth + letterSpacing)),
                y: wordInset.height
            )
            
            letterLabel.text = String(lettersToScatter[letterIndex])
            
            letterLabels.append(letterLabel)
        }
        
        self.lettersToScatter = letterLabels
     */
    }
    
    
    // MARK: - IB Actions

    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
    }
    
}

