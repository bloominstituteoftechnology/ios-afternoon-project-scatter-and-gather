//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Chad Parker on 4/10/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let duration = 0.3
    
    var isScattered = false
    let l = UILabel()
    let a = UILabel()
    let m = UILabel()
    let b = UILabel()
    let d = UILabel()
    let aa = UILabel()
    var letters: [UILabel] = []
    let logoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpViews()
    }
    
    private func setUpViews() {
        
        // logo
        logoImageView.image = UIImage(named: "lambda_logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.5)
        ])

        letters = [l, a, m, b, d, aa]
        for (i, char) in "Lambda".enumerated() {
            letters[i].text = String(char)
        }
        letters.forEach {
            $0.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
            $0.textAlignment = .center
            self.view.addSubview($0)
        }
        positionLettersAtTop()
    }
    
    private func positionLettersAtTop() {
        // https://www.hackingwithswift.com/articles/103/seven-useful-methods-from-cgrect
        let lettersFrame = view.safeAreaLayoutGuide.layoutFrame
            .insetBy(dx: 50, dy: 40)
            .divided(atDistance: 70, from: .minYEdge).slice
        var remainingLettersFrame = lettersFrame
        let letterWidth = lettersFrame.width / CGFloat(letters.count)
        
        letters.forEach {
            let divided = remainingLettersFrame.divided(atDistance: letterWidth, from: .minXEdge)
            remainingLettersFrame = divided.remainder
            $0.frame = divided.slice
        }
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            animateGather()
            isScattered = false
        } else {
            animateScatter()
            isScattered = true
        }
    }

    /// assign random background and text color
    /// custom transform to rotate
    /// custom animations?
    private func animateScatter() {
        let layoutFrame = view.safeAreaLayoutGuide.layoutFrame
        let letterSize = letters[0].bounds.size
        letters.forEach { letter in
            UIView.animate(withDuration: duration) {
                letter.frame.origin.x = CGFloat.random(in: 0..<(layoutFrame.width - letterSize.width))
                letter.frame.origin.y = CGFloat.random(in: 0..<(layoutFrame.height - letterSize.height))
                    + layoutFrame.minY
            }
        }
        //Int.random(in: 0...)
        
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 0
        }
    }
    
    /// reset letter properties
    private func animateGather() {
        UIView.animate(withDuration: duration) {
            self.positionLettersAtTop()
        }
        
        letters.forEach {
            $0.transform = .identity
        }
        
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 1
        }
    }
}
