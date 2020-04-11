//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Kevin Stewart on 1/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isScattered = false
    private var imageView = UIImageView()
    private var stackView = UIStackView()
    private var toggleButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureStackView()
        configureLabels()
    }

    // MARK: - Programmatic Constraints

    private func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.center = view.center

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func configureLabels() {

        // Labels
        let lLabel = UILabel()
            lLabel.translatesAutoresizingMaskIntoConstraints = false
            lLabel.text = "L"
            lLabel.font = UIFont.systemFont(ofSize: 50)
            stackView.addArrangedSubview(lLabel)
            
        let a1Label = UILabel()
            a1Label.translatesAutoresizingMaskIntoConstraints = false
            a1Label.text = "A"
            a1Label.font = UIFont.systemFont(ofSize: 50)
            stackView.addArrangedSubview(a1Label)
            
        let mLabel = UILabel()
            mLabel.translatesAutoresizingMaskIntoConstraints = false
            mLabel.text = "M"
            mLabel.font = UIFont.systemFont(ofSize: 50)
            stackView.addArrangedSubview(mLabel)
            
        let bLabel = UILabel()
            bLabel.translatesAutoresizingMaskIntoConstraints = false
            bLabel.text = "B"
            bLabel.font = UIFont.systemFont(ofSize: 50)
            stackView.addArrangedSubview(bLabel)
            
        let dLabel = UILabel()
            dLabel.translatesAutoresizingMaskIntoConstraints = false
            dLabel.text = "D"
            dLabel.font = UIFont.systemFont(ofSize: 50)
            stackView.addArrangedSubview(dLabel)
            
        let a2Label = UILabel()
            a2Label.translatesAutoresizingMaskIntoConstraints = false
            a2Label.text = "A"
            a2Label.font = UIFont.systemFont(ofSize: 50)
            stackView.addArrangedSubview(a2Label)
            
        // Image logo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lambda_logo")
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25),
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

    // MARK: - Methods
    
    // Scatter function
    @objc private func scatter() {
        if isScattered {
            isScattered = false
            UIView.animate(withDuration: 2.0) {
                for view in self.stackView.arrangedSubviews {
                    if let label = view as? UILabel {
                        label.alpha = 0
                        self.stackView.addArrangedSubview(label) //brings everything back into place
                        label.alpha = 1
                        self.imageView.alpha = 1
                        label.textColor = .black
                        label.backgroundColor = .clear
                        label.transform = .identity //label turns upright
                    }
                }
            }
        } else {
            isScattered = true
            UIView.animate(withDuration: 2.0) {
                for view in self.stackView.arrangedSubviews {
                    if let label = view as? UILabel {
                        self.randomColor(label)
                        let maxX = self.view.bounds.maxX - label.bounds.width - label.bounds.maxX
                        let randomX = CGFloat.random(in: 0..<maxX)
                        
                        let maxY = self.view.bounds.maxY - label.bounds.maxY - label.bounds.height - 50 // -50 because stack view is 50 points from the top of the view
                        let randomY = CGFloat.random(in: 0..<maxY)
                        
                        label.layer.position = CGPoint(x: randomX, y: randomY)
                        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...8))
                        self.imageView.alpha = 0
                    }
                }
            }
        }
    }

    // Picks a random color
    private func randomColor(_ label: UILabel) {
        let diffTextColor = CGFloat.random(in: 0.1...3.0) //picks a random color between these two hue's
        label.textColor = UIColor(hue: diffTextColor, saturation: diffTextColor, brightness: diffTextColor, alpha: diffTextColor)
        let diffBackroundColor = CGFloat.random(in: 0.1...3.0)
        label.backgroundColor = UIColor(hue: diffBackroundColor, saturation: diffBackroundColor, brightness: diffBackroundColor, alpha: diffBackroundColor)
    }

    // MARK: - Actions
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        scatter()
        }
    }

