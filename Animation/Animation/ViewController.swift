//
//  ViewController.swift
//  Animation
//
//  Created by Claudia Contreras on 4/10/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    var isScattered: Bool = false
    var newlocation: [CGFloat] = []
    
    //MARK: - IBOutlets
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBAction
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            gatherAnimation()
        } else {
            scatterAnimation()
        }
        
        isScattered.toggle()
    }
    
    //MARK: - Animation Functions
    private func scatterAnimation() {
        fadeLogo()
        moveLettersRandomly()
        makeRandomColor()
    }
    
    private func gatherAnimation() {
        unfadeLogo()
        moveLettersBack()
        backToNormalColor()
    }
    
    private func fadeLogo() {
        imageView.center = view.center
        
        UIView.animate(withDuration: 3.0) {
            self.imageView.alpha = 0.0
        }
    }
    
    private func unfadeLogo() {
        UIView.animate(withDuration: 3.0) {
            self.imageView.alpha = 1.0
        }
    }
    
    private func moveLettersRandomly() {
        UIView.animate(withDuration: 3.0) {
            for label in self.labels {
                 let newLocation = self.getRandomLocation(oldX: label.frame.origin.x, oldY: label.frame.origin.y)
                label.transform = CGAffineTransform(translationX: newLocation[0], y: newLocation[1]).rotated(by: self.rotationAngleRandomizer())
            }
        }
    }
    
    private func moveLettersBack() {
        UIView.animate(withDuration: 3.0) {
            for label in self.labels {
                label.transform = .identity
            }
        }
    }
    
    
    private func makeRandomColor() {
        UIView.transition(with: view, duration: 3, options: [.repeat, .autoreverse], animations: {
            for label in self.labels {
                label.textColor = UIColor(red: self.getRandomColor(), green: self.getRandomColor(), blue: self.getRandomColor(), alpha: 1)
                label.layer.backgroundColor = UIColor(red: self.getRandomColor(), green: self.getRandomColor(), blue: self.getRandomColor(), alpha: 1).cgColor
            }
        }, completion: nil)
    }
    
    private func backToNormalColor() {
        UIView.animate(withDuration: 3.0) {
            for label in self.labels {
                label.textColor = .black
                label.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
    private func getRandomLocation(oldX: CGFloat, oldY: CGFloat) -> [CGFloat] {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let newX = CGFloat.random(in: -oldX...(width - oldX))
        let newY = CGFloat.random(in: -oldY...(height - oldY))

        return [newX, newY]
    }
    
    private func getRandomColor() -> CGFloat {
        return CGFloat.random(in: 1...255)/255
    }
    
    private func rotationAngleRandomizer() -> CGFloat {
        return (CGFloat.pi * CGFloat.random(in: 1...4))
    }
}

