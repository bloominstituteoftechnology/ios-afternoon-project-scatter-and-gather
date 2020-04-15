//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Chad Parker on 4/10/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let duration: TimeInterval = 1
    
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

    private func animateScatter() {
        let layoutFrame = view.safeAreaLayoutGuide.layoutFrame
        let letterSize = letters[0].bounds.size
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 0
            self.letters.forEach {
                let randomRotation = CGAffineTransform(rotationAngle: .pi * CGFloat.random(in: 0..<2))
                let randomTranslation = CGAffineTransform(
                    translationX: CGFloat.random(in: 0..<(layoutFrame.width - letterSize.width)) - $0.frame.origin.x,
                    y: CGFloat.random(in: 0..<(layoutFrame.height - letterSize.height)) - $0.frame.origin.y + layoutFrame.minY
                )
                $0.transform = randomRotation.concatenating(randomTranslation)
                $0.layer.backgroundColor = UIColor.randomLightHue().cgColor
                $0.textColor = UIColor.randomDarkHue()
            }
        }
    }

    private func animateGather() {
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 1
            self.letters.forEach {
                $0.transform = .identity
                $0.layer.backgroundColor = UIColor.white.cgColor
                $0.textColor = .label
            }
        }
    }
}

extension UIColor {
    static func randomDarkHue() -> UIColor {
        UIColor(
            hue: CGFloat.random(in: 0...1),
            saturation: CGFloat.random(in: 0...1),
            brightness: CGFloat.random(in: 0...0.5),
            alpha: 1
        )
    }
    static func randomLightHue() -> UIColor {
        UIColor(
            hue: CGFloat.random(in: 0...1),
            saturation: CGFloat.random(in: 0...1),
            brightness: CGFloat.random(in: 0.9...1.0),
            alpha: 1
        )
    }
}
