//
//  ViewController.swift
//  ScatterGather
//
//  Created by Jorge Alvarez on 1/21/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var lLabel: UILabel!
    var aLabel: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!
    
    var isScattered: Bool = false
    
    var stackView: UIStackView!
    
    var labelArray: [UILabel] = []
    
    var logoImageView: UIImageView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureImage()
        configureLabels()
    }

    // MARK: - Views
    
    func configureNavBar() {
        let toggleButtonItem = UIBarButtonItem(title: "Toggle", style: .done, target: self, action: #selector(toggleButtonPressed))
        navigationItem.setRightBarButton(toggleButtonItem, animated: true)
        title = "Scatter & Gather"
    }
    
    func configureImage() {
        // ImageView
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "lambda_logo")
        //logoImageView.backgroundColor = .blue
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // Constraints
        logoImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func configureLabels() {
        
        // Labels
        lLabel = UILabel(); lLabel.text = "L"
        aLabel = UILabel(); aLabel.text = "A"
        mLabel = UILabel(); mLabel.text = "M"
        bLabel = UILabel(); bLabel.text = "B"
        dLabel = UILabel(); dLabel.text = "D"
        a2Label = UILabel(); a2Label.text = "A"
        
        labelArray = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        // StackView
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -20).isActive = true
        
        for label in labelArray {
            label.translatesAutoresizingMaskIntoConstraints = false
            //label.textColor = .red
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 60)
            view.addSubview(label)
            stackView.addArrangedSubview(label)
        }
    }
    
    // MARK: - Actions
    
    /*
     SCATTER Animation:
         -Fade out your logo image view (the logo should disappear over the length of the animation)
         -Move your letters to random locations (read the random Int API below)
         -Assign them a random background color and text color
         -Use a custom transform to rotate the views (letter.transform = CGAffineTransform(rotationAngle: random_angle)
         -Incorporate as many other custom animations as you like
         -Your animation should take between 2 and 4 seconds
     GATHER Animation:
         -Fade in your logo view (it should gradually reappear as the gather animation runs)
         -Reset all the custom properties you previously assigned to the letters (they should appear as they did at the start of the app)
         -Animate the letters back to their starting positions
     */

    @objc func toggleButtonPressed () {
        print("TOGGLE, isScattered is = \(isScattered)")
        isScattered.toggle()
        if isScattered {
            print("isScattered now = \(isScattered)")
            for label in labelArray {
                label.backgroundColor = .blue
            }
        } else {
            print("isScattered now = \(isScattered)")
            for label in labelArray {
                label.backgroundColor = .red
            }
        }
    }
}

