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
    
    //Boolen to hold value for current state of UILabels
    var isScattered: Bool = false
    
    //UIImageView to display Lambda Logo
    let lambdaLogo = UIImageView()
    
    //Create individual UILabels for each letter in "LAMBDA"
    let lLabel = UILabel()
    let aLabel = UILabel()
    let mLabel = UILabel()
    let bLabel = UILabel()
    let dLabel = UILabel()
    let a2Label = UILabel()
    
    //Array to hold UILabels for manipulation later
    var labelArray: [UILabel] = []
    
    //Array to hold original coordinates for each UILabel, and a counting index, used in "Gather" animation
    var originalCoordinates: [CGPoint] = []
    var labelIndex: Int = 0
    
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
    
        scatterAnimation()
        //gatherAnimation()
        
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
    
    private func scatterAnimation() {
        
        //Begin logo fading and label scattering
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: [], animations: {
            
            //Fade out Lambda Logo
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                self.lambdaLogo.alpha = 0.0
            }
            
            //Scatter each label to a randomly generated location, with new backgroundColor and textColor
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
               for label in self.labelArray {
                   //Move label to new random coordinates
                   self.originalCoordinates.append(label.center)
                   let newCoordinates = self.getRandomCoordinates(for: label)
                   label.center = CGPoint(x: newCoordinates[0], y: newCoordinates[1])
               }
            }
            
            //Randomly color each labels background color
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for label in self.labelArray {
                    let randomLabelColorInt = Int.random(in: 0...5)
                    label.layer.backgroundColor = self.setColors(for: randomLabelColorInt).cgColor
                }
            }
            
            //Randomly set the textColor property of each label
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for label in self.labelArray {
                    var randomTextColorInt = Int.random(in: 0...5)
                    
                    while self.setColors(for: randomTextColorInt).cgColor == label.layer.backgroundColor {
                        randomTextColorInt = Int.random(in: 0...5)
                    }
                    
                    label.textColor = self.setColors(for: randomTextColorInt)
                }
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
               for label in self.labelArray {
                   label.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
               }
            }
            
        }, completion: { (_) in
            self.gatherAnimation()
        })
        
    }
    
    //Animation to gather letters to original position, and reset label color properties
    private func gatherAnimation() {
        
        UIView.animateKeyframes(withDuration: 2.2, delay: 0.0, options: [], animations: {
            
            //Fade Lambda Logo back in
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1.0) {
                self.lambdaLogo.alpha = 1.0
            }
            
            //Reset Labels to original properties.
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1.0) {
                
                self.labelIndex = 0
                
                for label in self.labelArray {
                    
                    //Reset labels to original values
                    label.center = self.originalCoordinates[self.labelIndex]
                    self.labelIndex += 1
                    
                    label.transform = .identity
                    label.layer.backgroundColor = UIColor.clear.cgColor
                    label.textColor = .black
                }
            }
            
        }, completion: { (_) in
            self.toggleButton.isEnabled = true
        })
        
    }
    
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
        
        //Create array of colors to allow random number to choose random color
        let colorArray: [UIColor] = [UIColor.red,
                                     UIColor.blue,
                                     UIColor.yellow,
                                     UIColor.green,
                                     UIColor.orange,
                                     UIColor.darkGray]
        
        return colorArray[int]
    }
    
}
