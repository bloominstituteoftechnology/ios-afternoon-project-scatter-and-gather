//
//  ViewController.swift
//  Scatter
//
//  Created by Chris Gonzales on 2/18/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

struct DesignVariables{
    
    static let imageName: String = "lambda_logo"
    
    static let topAnchorSpacing: CGFloat = 20
    static let fontSize: UIFont = UIFont.boldSystemFont(ofSize: 70)
    static let textAlignment: NSTextAlignment = .center
    
    
    static let borderWidth: CGFloat = 2
    static let borderColor: CGColor = UIColor.black.cgColor
    static let cornerRadius: CGFloat = 5
    
    static let firstLabelLeadingConstraintConstant: CGFloat = 10
    static let followingLabelLeadingConstraintConstant: CGFloat = 5
    static let labelHeight: CGFloat = 100
    static let labelWidth: CGFloat = 150
    static let labelBackgroundColor: CGColor = UIColor.black.cgColor
    
    static let imageViewTopConstraint: CGFloat = 8
    
}

struct AnimationVariables{
    
    static func durationRandomizer() -> TimeInterval{
        return Double.random(in: 2...5)
    }
    static func rotationAngleRandomizer () -> CGFloat {
        return (CGFloat.pi * CGFloat.random(in: -2...2))
    }
    static func translationXRandomizer () -> CGFloat {
        return CGFloat.random(in: 0...250)
    }
    static func translationYRandomizer () -> CGFloat {
        return CGFloat.random(in: 0...300)
    }
    
    static let colors: [UIColor] = [.blue,
                                    .brown,
                                    .clear,
                                    .cyan,
                                    .gray,
                                    .green,
                                    .magenta,
                                    .orange,
                                    .purple,
                                    .systemPink,
                                    .red,
                                    .systemTeal]
}


class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var isScattered: Bool = false
    var lLabel: UILabel!
    var a1Label: UILabel!
    var mLabel: UILabel!
    var bLabel: UILabel!
    var dLabel: UILabel!
    var a2Label: UILabel!
    var logoImage: UIImageView!
    
    
    // MARK: - Methods
    
    private func scatterToggled(){
        isScattered = !isScattered
        if isScattered{
            scatterAllLetters()
        } else {
            gatherLetters()
        }
        
    }
    
    func scatterAllLetters(){
        
        let imageFadeBlock = {
            UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.logoImage.alpha = 0
            }
        }
        
        let lLabelAnimationBlock = {
            UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                self.lLabel.transform = CGAffineTransform(translationX: -2, y: 0)
            }
            
            UILabel.addKeyframe(withRelativeStartTime: 0.1,
                                relativeDuration: Double.random(in: 0.3...1)) {
                                    self.lLabel.transform = CGAffineTransform(translationX: AnimationVariables.translationXRandomizer(),
                                                                              y: AnimationVariables.translationYRandomizer()).rotated(by: AnimationVariables.rotationAngleRandomizer())
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0) {
                self.lLabel.text = self.randomString(length: 1)
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0) {
                self.lLabel.backgroundColor = AnimationVariables.colors.randomElement()
                self.lLabel.alpha = CGFloat.random(in: 0.15...1)
            }
        }
        let a1LabelAnimationBlock = {
            UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                self.a1Label.transform = CGAffineTransform(translationX: -2, y: 0)
            }
            
            UILabel.addKeyframe(withRelativeStartTime: 0.05,
                                relativeDuration: Double.random(in: 0.3...1)) {
                                    self.a1Label.transform = CGAffineTransform(translationX: AnimationVariables.translationXRandomizer(),
                                                                              y: AnimationVariables.translationYRandomizer()).rotated(by: AnimationVariables.rotationAngleRandomizer())
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                self.a1Label.text = self.randomString(length: 1)
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                self.a1Label.backgroundColor = AnimationVariables.colors.randomElement()
                self.a1Label.alpha = CGFloat.random(in: 0.1...1)
            }
        }
        let mLabelAnimationBlock = {
                UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                    self.mLabel.transform = CGAffineTransform(translationX: -2, y: 0)
                }
                
                UILabel.addKeyframe(withRelativeStartTime: 0.05,
                                    relativeDuration: Double.random(in: 0.3...1)) {
                                        self.mLabel.transform = CGAffineTransform(translationX: AnimationVariables.translationXRandomizer(),
                                                                                  y: AnimationVariables.translationYRandomizer()).rotated(by: AnimationVariables.rotationAngleRandomizer())
                }
                UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                    self.mLabel.text = self.randomString(length: 1)
                }
                UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                    self.mLabel.backgroundColor = AnimationVariables.colors.randomElement()
                    self.mLabel.alpha = CGFloat.random(in: 0.1...1)
                }
            }
        let bLabelAnimationBlock = {
                UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                    self.bLabel.transform = CGAffineTransform(translationX: -2, y: 0)
                }
                
                UILabel.addKeyframe(withRelativeStartTime: 0.05,
                                    relativeDuration: Double.random(in: 0.3...1)) {
                                        self.bLabel.transform = CGAffineTransform(translationX: AnimationVariables.translationXRandomizer(),
                                                                                  y: AnimationVariables.translationYRandomizer()).rotated(by: AnimationVariables.rotationAngleRandomizer())
                }
                UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                    self.bLabel.text = self.randomString(length: 1)
                }
                UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                    self.bLabel.backgroundColor = AnimationVariables.colors.randomElement()
                    self.bLabel.alpha = CGFloat.random(in: 0.1...1)
                }
            }
        let dLabelAnimationBlock = {
            UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                self.dLabel.transform = CGAffineTransform(translationX: -2, y: 0)
            }
            
            UILabel.addKeyframe(withRelativeStartTime: 0.05,
                                relativeDuration: Double.random(in: 0.3...1)) {
                                    self.dLabel.transform = CGAffineTransform(translationX: AnimationVariables.translationXRandomizer(),
                                                                              y: AnimationVariables.translationYRandomizer()).rotated(by: AnimationVariables.rotationAngleRandomizer())
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                self.dLabel.text = self.randomString(length: 1)
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                self.dLabel.backgroundColor = AnimationVariables.colors.randomElement()
                self.dLabel.alpha = CGFloat.random(in: 0.1...1)
            }
        }
        let a2LabelAnimationBlock = {
            UILabel.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                self.a2Label.transform = CGAffineTransform(translationX: -2, y: 0)
            }
            
            UILabel.addKeyframe(withRelativeStartTime: 0.05,
                                relativeDuration: Double.random(in: 0.3...1)) {
                                    self.a2Label.transform = CGAffineTransform(translationX: AnimationVariables.translationXRandomizer(),
                                                                              y: AnimationVariables.translationYRandomizer()).rotated(by: AnimationVariables.rotationAngleRandomizer())
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                self.a2Label.text = self.randomString(length: 1)
            }
            UILabel.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0) {
                self.a2Label.backgroundColor = AnimationVariables.colors.randomElement()
                self.a2Label.alpha = CGFloat.random(in: 0.1...1)
            }
        }
        
        UILabel.animateKeyframes(withDuration: AnimationVariables.durationRandomizer(),
                                 delay: 0, options: [],
                                 animations: lLabelAnimationBlock, completion: nil)
        UILabel.animateKeyframes(withDuration: AnimationVariables.durationRandomizer(),
                                 delay: 0, options: [],
                                 animations: a1LabelAnimationBlock, completion: nil)
        UILabel.animateKeyframes(withDuration: AnimationVariables.durationRandomizer(),
                                 delay: 0, options: [],
                                 animations: mLabelAnimationBlock, completion: nil)
        UILabel.animateKeyframes(withDuration: AnimationVariables.durationRandomizer(),
                                 delay: 0, options: [],
                                 animations: bLabelAnimationBlock, completion: nil)
        UILabel.animateKeyframes(withDuration: AnimationVariables.durationRandomizer(),
                                 delay: 0, options: [],
                                 animations: dLabelAnimationBlock, completion: nil)
        UILabel.animateKeyframes(withDuration: AnimationVariables.durationRandomizer(),
                                 delay: 0, options: [],
                                 animations: a2LabelAnimationBlock, completion: nil)
        UIImageView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: imageFadeBlock, completion: nil)
    }
    
    func gatherLetters(){
        let animationBlock = {
            self.logoImage.transform = .identity
            self.lLabel.transform = .identity
            self.lLabel.text = "L"
            self.lLabel.alpha = 1
            self.lLabel.backgroundColor = .clear
            self.a1Label.transform = .identity
            self.a1Label.text = "A"
            self.a1Label.alpha = 1
            self.a1Label.backgroundColor = .clear
            self.mLabel.transform = .identity
            self.mLabel.text = "M"
            self.mLabel.alpha = 1
            self.mLabel.backgroundColor = .clear
            self.bLabel.transform = .identity
            self.bLabel.text = "B"
            self.bLabel.alpha = 1
            self.bLabel.backgroundColor = .clear
            self.dLabel.transform = .identity
            self.dLabel.text = "D"
            self.dLabel.alpha = 1
            self.dLabel.backgroundColor = .clear
            self.a2Label.transform = .identity
            self.a2Label.text = "A"
            self.a2Label.alpha = 1
            self.a2Label.backgroundColor = .clear
            self.logoImage.alpha = 1
        }
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    // MARK: - Actions
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        scatterToggled()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        configureImage()
    }
    
    // MARK: - UI Elements
    
    private func configureLabels(){
        
        
        // "L"  Label
        
        lLabel = UILabel(frame: CGRect(x: 0,
                                       y: 0,
                                       width: DesignVariables.labelWidth,
                                       height: DesignVariables.labelHeight))
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.text = "L"
        lLabel.textAlignment = DesignVariables.textAlignment
        lLabel.font = DesignVariables.fontSize
        lLabel.layer.borderWidth = DesignVariables.borderWidth
        lLabel.layer.borderColor = DesignVariables.borderColor
        lLabel.layer.cornerRadius = DesignVariables.cornerRadius
        lLabel.layer.masksToBounds = true
        self.view.addSubview(lLabel)
        
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                        constant: DesignVariables.firstLabelLeadingConstraintConstant).isActive = true
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                    constant: DesignVariables.topAnchorSpacing).isActive = true
        
        
        // "A" label -first
        
        a1Label = UILabel(frame: CGRect(x: 0,
                                        y: 0,
                                        width: DesignVariables.labelWidth,
                                        height: DesignVariables.labelHeight))
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        a1Label.text = "A"
        a1Label.textAlignment = DesignVariables.textAlignment
        a1Label.font = DesignVariables.fontSize
        a1Label.layer.borderWidth = DesignVariables.borderWidth
        a1Label.layer.borderColor = DesignVariables.borderColor
        a1Label.layer.cornerRadius = DesignVariables.cornerRadius
        self.view.addSubview(a1Label)
        
        a1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                     constant: DesignVariables.topAnchorSpacing).isActive = true
        a1Label.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor,
                                         constant: DesignVariables.followingLabelLeadingConstraintConstant).isActive = true
        
        // "M" label
        
        mLabel = UILabel(frame: CGRect(x: 0,
                                       y: 0,
                                       width: DesignVariables.labelWidth,
                                       height: DesignVariables.labelHeight))
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.text = "M"
        mLabel.textAlignment = DesignVariables.textAlignment
        mLabel.font = DesignVariables.fontSize
        mLabel.layer.borderWidth = DesignVariables.borderWidth
        mLabel.layer.borderColor = DesignVariables.borderColor
        mLabel.layer.cornerRadius = DesignVariables.cornerRadius
        self.view.addSubview(mLabel)
        
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                    constant: DesignVariables.topAnchorSpacing).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: a1Label.trailingAnchor,
                                        constant: DesignVariables.followingLabelLeadingConstraintConstant).isActive = true
        
        // "B" label
        
        bLabel = UILabel(frame: CGRect(x: 0,
                                       y: 0,
                                       width: DesignVariables.labelWidth,
                                       height: DesignVariables.labelHeight))
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "B"
        bLabel.textAlignment = DesignVariables.textAlignment
        bLabel.font = DesignVariables.fontSize
        bLabel.layer.borderWidth = DesignVariables.borderWidth
        bLabel.layer.borderColor = DesignVariables.borderColor
        bLabel.layer.cornerRadius = DesignVariables.cornerRadius
        self.view.addSubview(bLabel)
        
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                    constant: DesignVariables.topAnchorSpacing).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor,
                                        constant: DesignVariables.followingLabelLeadingConstraintConstant).isActive = true
        
        // "D" label
        
        dLabel = UILabel(frame: CGRect(x: 0,
                                       y: 0,
                                       width: DesignVariables.labelWidth,
                                       height: DesignVariables.labelHeight))
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.text = "D"
        dLabel.textAlignment = DesignVariables.textAlignment
        dLabel.font = DesignVariables.fontSize
        dLabel.layer.borderWidth = DesignVariables.borderWidth
        dLabel.layer.borderColor = DesignVariables.borderColor
        dLabel.layer.cornerRadius = DesignVariables.cornerRadius
        view.addSubview(dLabel)
        
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                    constant: DesignVariables.topAnchorSpacing).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor,
                                        constant: DesignVariables.followingLabelLeadingConstraintConstant).isActive = true
        
        // "A" label
        
        a2Label = UILabel(frame: CGRect(x: 0,
                                        y: 0,
                                        width: DesignVariables.labelWidth,
                                        height: DesignVariables.labelHeight))
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        a2Label.text = "A"
        a2Label.textAlignment = DesignVariables.textAlignment
        a2Label.font = DesignVariables.fontSize
        a2Label.layer.borderWidth = DesignVariables.borderWidth
        a2Label.layer.borderColor = DesignVariables.borderColor
        a2Label.layer.cornerRadius = DesignVariables.cornerRadius
        view.addSubview(a2Label)
        
        a2Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                     constant: DesignVariables.topAnchorSpacing).isActive = true
        a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor,
                                         constant: DesignVariables.followingLabelLeadingConstraintConstant).isActive = true
        
    }
    
    private func configureImage(){
        logoImage = UIImageView(frame: CGRect(x: 0, y: 0,
                                              width: 200,
                                              height: 50))
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(imageLiteralResourceName: DesignVariables.imageName)
        view.addSubview(logoImage)
        
        logoImage.topAnchor.constraint(equalTo: lLabel.bottomAnchor,
                                       constant: DesignVariables.imageViewTopConstraint).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4).isActive = true
        logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor, multiplier: 0.13).isActive = true
        
    }
}

