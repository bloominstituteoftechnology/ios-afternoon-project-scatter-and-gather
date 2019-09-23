//
//  ViewController.swift
//  Scatter&Gather
//
//  Created by Bobby Keffury on 9/21/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let imageView = UIImageView()
    let letter1 = UILabel()
    let letter2 = UILabel()
    let letter3 = UILabel()
    let letter4 = UILabel()
    let letter5 = UILabel()
    let letter6 = UILabel()
 
    
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        
    }
    
    func setUpSubviews() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed(_:)))
        navigationItem.title = "Scatter & Gather"
        
        
        imageView.image = UIImage(named: "lambda_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        
        
        letter1.font = UIFont.systemFont(ofSize: 30)
        letter1.text = "L"
        letter1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter1)
        letter1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90).isActive = true
        letter1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        letter1.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
        letter2.font = UIFont.systemFont(ofSize: 30)
        letter2.text = "a"
        letter2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter2)
        letter2.leadingAnchor.constraint(equalTo: letter1.trailingAnchor, constant: 20).isActive = true
        letter2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        letter2.widthAnchor.constraint(equalToConstant: 25).isActive = true
      
        
        
        letter3.font = UIFont.systemFont(ofSize: 30)
        letter3.text = "m"
        letter3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter3)
        letter3.leadingAnchor.constraint(equalTo: letter2.trailingAnchor, constant: 20).isActive = true
        letter3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        letter3.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
        letter4.font = UIFont.systemFont(ofSize: 30)
        letter4.text = "b"
        letter4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter4)
        letter4.leadingAnchor.constraint(equalTo: letter3.trailingAnchor, constant: 20).isActive = true
        letter4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        letter4.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
        letter5.font = UIFont.systemFont(ofSize: 30)
        letter5.text = "d"
        letter5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter5)
        letter5.leadingAnchor.constraint(equalTo: letter4.trailingAnchor, constant: 20).isActive = true
        letter5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        letter5.widthAnchor.constraint(equalToConstant: 25).isActive = true
       
        
        
        letter6.font = UIFont.systemFont(ofSize: 30)
        letter6.text = "a"
        letter6.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(letter6)
        letter6.leadingAnchor.constraint(equalTo: letter5.trailingAnchor, constant: 20).isActive = true
        letter6.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        letter6.widthAnchor.constraint(equalToConstant: 25).isActive = true
        letter6.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
        
        
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered == false {
            scatterAnimation()
            isScattered = !isScattered
        } else {
            gatherAnimation()
            isScattered = !isScattered
        }
    }
    
    func scatterAnimation() {

        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {

            // Image fade out
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.imageView.alpha = 0.0
            }

            // Labels
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {


                // Location

                self.letter1.center = // random position
                self.letter2.center =
                self.letter3.center =
                self.letter4.center =
                self.letter5.center =
                self.letter6.center =

                // Background color

                self.letter1.backgroundColor = // random color
                self.letter2.backgroundColor =
                self.letter3.backgroundColor =
                self.letter4.backgroundColor =
                self.letter5.backgroundColor =
                self.letter6.backgroundColor =

                // Text color

                self.letter1.textColor = // random color
                self.letter2.textColor =
                self.letter3.textColor =
                self.letter4.textColor =
                self.letter5.textColor =
                self.letter6.textColor =

                // Rotate views
                self.letter1.transform = CGAffineTransform(rotationAngle: 1)
                self.letter2.transform = CGAffineTransform(rotationAngle: 1)
                self.letter3.transform = CGAffineTransform(rotationAngle: 1)
                self.letter4.transform = CGAffineTransform(rotationAngle: 1)
                self.letter5.transform = CGAffineTransform(rotationAngle: 1)
                self.letter6.transform = CGAffineTransform(rotationAngle: 1)
            }

        }, completion: nil)
    }


    func gatherAnimation() {

        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {

            // Image fade in
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.imageView.alpha = 1.0
            }

            // Labels
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {

                // Location

                self.letter1.center = // need to set to original position
                self.letter2.center =
                self.letter3.center =
                self.letter4.center =
                self.letter5.center =
                self.letter6.center =

                // Background color

                self.letter1.backgroundColor = .white
                self.letter2.backgroundColor = .white
                self.letter3.backgroundColor = .white
                self.letter4.backgroundColor = .white
                self.letter5.backgroundColor = .white
                self.letter6.backgroundColor = .white

                // Text color

                self.letter1.textColor = .black
                self.letter2.textColor = .black
                self.letter3.textColor = .black
                self.letter4.textColor = .black
                self.letter5.textColor = .black
                self.letter6.textColor = .black

                // Rotate views

                self.letter1.transform = .identity
                self.letter2.transform = .identity
                self.letter3.transform = .identity
                self.letter4.transform = .identity
                self.letter5.transform = .identity
                self.letter6.transform = .identity


            }

        }, completion: nil)


    }

}

