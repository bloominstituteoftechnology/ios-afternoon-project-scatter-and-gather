//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Eoin Lavery on 20/09/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    var isScattered: Bool = false
    let lambdaLogo = UIImageView()
    let lLabel = UILabel()
    let aLabel = UILabel()
    let mLabel = UILabel()
    let bLabel = UILabel()
    let dLabel = UILabel()
    let a2Label = UILabel()
    var labelArray: [UILabel] = []
    
    //MARK: - IBOutlets
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLambdaLogo()
        configureLabels()
    }

    //MARK: - IBActions
    @IBAction func toggleButtonPressed(_ sender: Any) {

        //Disable toggleButton
        toggleButton.isEnabled = false
        
        //Create Array to hold orginal label positions, and index to iterate through array
        var originalCoordinates: [CGPoint] = []
        var labelIndex = 0
            
        //Scatter Animation
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [], animations: {
            //Fade Lambda Logo out
            self.lambdaLogo.alpha = 0.0
            
            //Iterate through each label, setting new position, changing colors, and changing rotation angle.
            for label in self.labelArray {
                
                //Move label to new random coordinates
                originalCoordinates.append(label.center)
                let newCoordinates = self.getRandomCoordinates(for: label)
                label.center = CGPoint(x: newCoordinates[0], y: newCoordinates[1])
                
                //Set textColor and layer.backgroundColor for each label to a random color
                let randomTextColorInt = Int.random(in: 1...6)
                var randomLabelColorInt = Int.random(in: 1...6)
                
                while randomTextColorInt == randomLabelColorInt {
                    randomLabelColorInt = Int.random(in: 1...6)
                }
                
                label.textColor = self.setColors(for: randomTextColorInt)
                label.layer.backgroundColor = self.setColors(for: randomLabelColorInt).cgColor
            }
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [], animations: {
            for label in self.labelArray {
                label.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
            }
        }, completion: nil)
        
        //Gather Animation
        UIView.animate(withDuration: 2.00, delay: 2.5, options: .curveEaseOut, animations: {
            self.lambdaLogo.alpha = 1.0
            
            for label in self.labelArray {
                
                //Move label to associated previous coordinates
                label.center = originalCoordinates[labelIndex]
                labelIndex += 1
                
                label.transform = .identity
            }
            
        }, completion: { (_) in
            self.toggleButton.isEnabled = true
        })
    }
    
    //MARK: - Constraints Functions
    func configureLambdaLogo() {
        lambdaLogo.image = UIImage(named: "lambda_logo")
        lambdaLogo.contentMode = .scaleAspectFit
        lambdaLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lambdaLogo)
        NSLayoutConstraint.activate([
            lambdaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lambdaLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            lambdaLogo.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            lambdaLogo.heightAnchor.constraint(equalTo: lambdaLogo.widthAnchor, multiplier: 0.5)
        ])
    }
    
    func configureLabels() {
        
        labelArray = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        //Get size of screen width to calculate size of Labels for each display.
        let labelDimension = view.frame.width / 8
        
        //Create font size based on 5/6 the size of the labelDimenson
        let fontSize = (labelDimension / 6) * 5
        
        //Calculate spacing inbetween each letter, and for the edge insets
        let labelSpacing: CGFloat = 5.0
        let leadingSpacing: CGFloat = (view.frame.width - ((labelDimension * 6) + (labelSpacing * 5))) / 2
        
        //Create UILabels for each letter in "Lambda"
        for label in labelArray {
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: fontSize)
            label.textAlignment = .center
            label.backgroundColor = .clear
        }
        
        lLabel.text = "L"
        aLabel.text = "A"
        mLabel.text = "M"
        bLabel.text = "B"
        dLabel.text = "D"
        a2Label.text = "A"
        
        NSLayoutConstraint.activate([
            lLabel.heightAnchor.constraint(equalToConstant: labelDimension),
            lLabel.widthAnchor.constraint(equalToConstant: labelDimension),
            lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingSpacing),
            lLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            aLabel.heightAnchor.constraint(equalToConstant: labelDimension),
            aLabel.widthAnchor.constraint(equalToConstant: labelDimension),
            aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 5.0),
            aLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0)
        ])
        
        NSLayoutConstraint.activate([
            mLabel.heightAnchor.constraint(equalToConstant: labelDimension),
            mLabel.widthAnchor.constraint(equalToConstant: labelDimension),
            mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 5.0),
            mLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0)
        ])
        
        NSLayoutConstraint.activate([
            bLabel.heightAnchor.constraint(equalToConstant: labelDimension),
            bLabel.widthAnchor.constraint(equalToConstant: labelDimension),
            bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 5.0),
            bLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0)
        ])
        
        NSLayoutConstraint.activate([
            dLabel.heightAnchor.constraint(equalToConstant: labelDimension),
            dLabel.widthAnchor.constraint(equalToConstant: labelDimension),
            dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 5.0),
            dLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0)
        ])
        
        NSLayoutConstraint.activate([
            a2Label.heightAnchor.constraint(equalToConstant: labelDimension),
            a2Label.widthAnchor.constraint(equalToConstant: labelDimension),
            a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 5.0),
            a2Label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0)
        ])
    }
    
    //MARK: - Animation Functions
    
    //Generate random coordinates and return in array
    private func getRandomCoordinates(for label: UILabel) -> [CGFloat] {
        
        //Get the screen area dimensions to keep labels within view of user
        let safeAreaHeight = self.view.frame.height * 0.9
        let safeAreaWidth = self.view.frame.width * 0.9
        
        //Set random X and Y position
        let newXPosition = CGFloat(Int.random(in: Int(label.frame.width)...Int(safeAreaWidth - label.frame.width)))
        let newYPosition = CGFloat(Int.random(in: Int(label.frame.height * 2)...Int(safeAreaHeight)))
        
        //Return new X and Y postions
        return [newXPosition, newYPosition]
    }
    
    //Generate random CGFloat angle for label rotation
    private func getRandomAngle() -> CGFloat {
        return CGFloat(Int.random(in: 60...300))
    }
    
    //Generate random CGFloat figure for scaling
    private func getRandomScaleFactor() -> CGFloat {
        return CGFloat(Double.random(in: 1.0...1.5))
    }

    //Generate UIColor depending on randomnly selected number, passed into function
    private func setColors(for int: Int) -> UIColor {
        switch int {
        case 1:
            return UIColor.red
        case 2:
            return UIColor.blue
        case 3:
            return UIColor.yellow
        case 4:
            return UIColor.green
        case 5:
            return UIColor.orange
        case 6:
            return UIColor.darkGray
        default:
            return UIColor.black
        }
    }
    
}
