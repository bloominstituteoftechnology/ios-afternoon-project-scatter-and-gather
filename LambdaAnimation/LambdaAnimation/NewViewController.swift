//
//  NewViewController.swift
//  LambdaAnimation
//
//  Created by Bradley Diroff on 3/17/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet var lambdaSign: UIImageView!
    
    let randomX = Int.random(in: 1...300)
    let randomY = Int.random(in: 1...600)
    let randomTurn = Int.random(in: 1...4)
    
    var isToggled: Bool = false
    
    var letterL = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var letterA = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var letterM = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var letterB = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var letterD = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var letterA2 = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    
    var startPointL: CGPoint?
    var startPointA: CGPoint?
    var startPointM: CGPoint?
    var startPointB: CGPoint?
    var startPointD: CGPoint?
    var startPointA2: CGPoint?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubviews()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        letterL.center = CGPoint(x: startPointL!.x, y: startPointL!.y)
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isToggled == false {
            messUpLetters()
        } else {
            print("START POINT: \(startPointL)")
            returnToNormal()
        }
    }
    
    func messUpLetters() {
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.letterL.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
                self.letterA.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.letterL.transform = .identity
                self.letterA.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.letterL.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
                self.letterA.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.letterL.center = self.view.center
                self.letterA.center = self.view.center
            }
        }, completion: nil)
        
        print("START POINT: \(startPointL)")
        
        isToggled = true
        
    }
    
    func returnToNormal() {
        
        guard let spotL = startPointL, let spotA = startPointA else {
            
            print("It doesnt have a start point")
            return}
        
        UIView.animate(withDuration: 2.0, animations: {
            
            self.lambdaSign.alpha = 1
            self.letterL.transform = .identity
            self.letterL.center = spotL
            self.letterA.transform = .identity
            self.letterA.center = spotA
            self.letterM.transform = .identity
            self.letterB.transform = .identity
            self.letterD.transform = .identity
            self.letterA2.transform = .identity
        })
        
        isToggled = false
        
    }
    
    func addSubviews() {
        
        let splitSections = (self.view.frame.maxX / 6)
        let middleSection = splitSections/2

        view.addSubview(letterL)
        letterL.widthAnchor.constraint(equalTo: letterL.heightAnchor).isActive = true
        letterL.translatesAutoresizingMaskIntoConstraints = false
        letterL.text = "L"
        letterL.textAlignment = .center
        letterL.font = UIFont.systemFont(ofSize: 60)
        
        view.addSubview(letterA)
        letterA.widthAnchor.constraint(equalTo: letterA.heightAnchor).isActive = true
        letterA.translatesAutoresizingMaskIntoConstraints = false
        letterA.text = "a"
        letterA.textAlignment = .center
        letterA.font = UIFont.systemFont(ofSize: 60)
        
        view.addSubview(letterM)
        letterM.center = view.center
        letterM.widthAnchor.constraint(equalTo: letterM.heightAnchor).isActive = true
        letterM.translatesAutoresizingMaskIntoConstraints = false
        letterM.text = "m"
        letterM.textAlignment = .center
        letterM.font = UIFont.systemFont(ofSize: 60)
        
        view.addSubview(letterB)
        letterB.center = view.center
        letterB.widthAnchor.constraint(equalTo: letterB.heightAnchor).isActive = true
        letterB.translatesAutoresizingMaskIntoConstraints = false
        letterB.text = "b"
        letterB.textAlignment = .center
        letterB.font = UIFont.systemFont(ofSize: 60)
        
        view.addSubview(letterD)
        letterD.center = view.center
        letterD.widthAnchor.constraint(equalTo: letterD.heightAnchor).isActive = true
        letterD.translatesAutoresizingMaskIntoConstraints = false
        letterD.text = "d"
        letterD.textAlignment = .center
        letterD.font = UIFont.systemFont(ofSize: 60)
     
        view.addSubview(letterA2)
        letterA2.center = view.center
        letterA2.widthAnchor.constraint(equalTo: letterA2.heightAnchor).isActive = true
        letterA2.translatesAutoresizingMaskIntoConstraints = false
        letterA2.text = "a"
        letterA2.textAlignment = .center
        letterA2.font = UIFont.systemFont(ofSize: 60)
    /*
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(letterL)
        stackView.addArrangedSubview(letterA)
        stackView.addArrangedSubview(letterM)
        stackView.addArrangedSubview(letterB)
        stackView.addArrangedSubview(letterD)
        stackView.addArrangedSubview(letterA2)
      
        print("START POINT: \(startPointL)")
      
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
 */
    
        startPointL = CGPoint(x: middleSection, y: 30)
        startPointA = CGPoint(x: middleSection + splitSections , y: 30)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
