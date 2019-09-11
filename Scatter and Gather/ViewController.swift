//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Andrew Ruiz on 9/10/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

// Testing Github

class ViewController: UIViewController {
    
    var isScattered : Bool = false
    
    var imageView: UIImageView!
    
    var letter1: UILabel!
    var letter2: UILabel!
    var letter3: UILabel!
    var letter4: UILabel!
    var letter5: UILabel!
    var letter6: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()

    }
    
    
    func setUpSubViews() {
        
        // imageView
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.image = UIImage(named: "lambda_logo")
        
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
        
        self.imageView = imageView
        
        
        // Letters
        let letter1 = UILabel()
        letter1.translatesAutoresizingMaskIntoConstraints = false
        letter1.text = "L"
        view.addSubview(letter1)
        
        let letter1TopConstraint = NSLayoutConstraint(item: letter1,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: view.safeAreaLayoutGuide,
                                                         attribute: .top,
                                                         multiplier: 1,
                                                         constant: 20)
        
        let letter1LeftConstraint = NSLayoutConstraint(item: letter1,
                                                      attribute: .left,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .left,
                                                      multiplier: 1,
                                                      constant: 20)
        
        NSLayoutConstraint.activate([letter1TopConstraint, letter1LeftConstraint])
        
        self.letter1 = letter1
        
        
        // Letter 2
        
        // Letters
        let letter2 = UILabel()
        letter2.translatesAutoresizingMaskIntoConstraints = false
        letter2.text = "A"
        view.addSubview(letter2)
        
        let letter2TopConstraint = NSLayoutConstraint(item: letter2,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 20)
        
        let letter2LeftConstraint = NSLayoutConstraint(item: letter2,
                                                       attribute: .left,
                                                       relatedBy: .equal,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .left,
                                                       multiplier: 1,
                                                       constant: 40)
        
        NSLayoutConstraint.activate([letter2TopConstraint, letter2LeftConstraint])
        
        self.letter2 = letter2
        
        // Letter 3
        
        // Letters
        let letter3 = UILabel()
        letter3.translatesAutoresizingMaskIntoConstraints = false
        letter3.text = "M"
        view.addSubview(letter3)
        
        let letter3TopConstraint = NSLayoutConstraint(item: letter3,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 20)
        
        let letter3LeftConstraint = NSLayoutConstraint(item: letter3,
                                                       attribute: .left,
                                                       relatedBy: .equal,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .left,
                                                       multiplier: 1,
                                                       constant: 60)
        
        NSLayoutConstraint.activate([letter3TopConstraint, letter3LeftConstraint])
        
        self.letter3 = letter3
        
        // Letter 4
        
        // Letters
        let letter4 = UILabel()
        letter4.translatesAutoresizingMaskIntoConstraints = false
        letter4.text = "B"
        view.addSubview(letter4)
        
        let letter4TopConstraint = NSLayoutConstraint(item: letter4,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 20)
        
        let letter4LeftConstraint = NSLayoutConstraint(item: letter4,
                                                       attribute: .left,
                                                       relatedBy: .equal,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .left,
                                                       multiplier: 1,
                                                       constant: 80)
        
        NSLayoutConstraint.activate([letter4TopConstraint, letter4LeftConstraint])
        
        self.letter4 = letter4
        
        // Letter 5
        

        let letter5 = UILabel()
        letter5.translatesAutoresizingMaskIntoConstraints = false
        letter5.text = "D"
        view.addSubview(letter5)
        
        let letter5TopConstraint = NSLayoutConstraint(item: letter5,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 20)
        
        let letter5LeftConstraint = NSLayoutConstraint(item: letter5,
                                                       attribute: .left,
                                                       relatedBy: .equal,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .left,
                                                       multiplier: 1,
                                                       constant: 100)
        
        NSLayoutConstraint.activate([letter5TopConstraint, letter5LeftConstraint])
        
        self.letter5 = letter5
        
        // Letter 6
        
        let letter6 = UILabel()
        letter6.translatesAutoresizingMaskIntoConstraints = false
        letter6.text = "A"
        view.addSubview(letter6)
        
        let letter6TopConstraint = NSLayoutConstraint(item: letter6,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: view.safeAreaLayoutGuide,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 20)
        
        let letter6LeftConstraint = NSLayoutConstraint(item: letter6,
                                                       attribute: .left,
                                                       relatedBy: .equal,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .left,
                                                       multiplier: 1,
                                                       constant: 120)
        
        NSLayoutConstraint.activate([letter6TopConstraint, letter6LeftConstraint])
        
        self.letter6 = letter6
        

    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == true {
            scatterAnimation()
            isScattered = false
        } else {
            gatherAnimation()
            isScattered = true
        }
        
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    func transform() -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: .random(in: 0...1)).translatedBy(x: .random(in: 50...400), y: .random(in: 100...900))
    }
    
    func scatterAnimation() {
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 0
            
            self.letter1.textColor = self.randomColor()
            self.letter1.backgroundColor = self.randomColor()
            self.letter1.transform = self.transform()
            
            self.letter2.textColor = self.randomColor()
            self.letter2.backgroundColor = self.randomColor()
            self.letter2.transform = self.transform()
            
            self.letter3.textColor = self.randomColor()
            self.letter3.backgroundColor = self.randomColor()
            self.letter3.transform = self.transform()
            
            self.letter4.textColor = self.randomColor()
            self.letter4.backgroundColor = self.randomColor()
            self.letter4.transform = self.transform()
            
            self.letter5.textColor = self.randomColor()
            self.letter5.backgroundColor = self.randomColor()
            self.letter5.transform = self.transform()
            
            self.letter6.textColor = self.randomColor()
            self.letter6.backgroundColor = self.randomColor()
            self.letter6.transform = self.transform()
    }
        
        
    }
    
    func gatherAnimation() {
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 1
            self.letter1.transform = .identity
            self.letter1.backgroundColor = .white
            self.letter1.textColor = .black
            
            self.letter2.transform = .identity
            self.letter2.backgroundColor = .white
            self.letter2.textColor = .black
            
            self.letter3.transform = .identity
            self.letter3.backgroundColor = .white
            self.letter3.textColor = .black
            
            self.letter4.transform = .identity
            self.letter4.backgroundColor = .white
            self.letter4.textColor = .black
            
            self.letter5.transform = .identity
            self.letter5.backgroundColor = .white
            self.letter5.textColor = .black
            
            self.letter6.transform = .identity
            self.letter6.backgroundColor = .white
            self.letter6.textColor = .black

        }
    }
}

