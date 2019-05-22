//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Jonathan Ferrer on 5/22/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!

    var labelLocations: [CGPoint] = []

    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        navigationItem.title = "Hello!"

        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == false {
            colorLabels()
            fadeOutLogo()
            scatterLabels()

            isScattered = true
        } else {
            unColorLabels()
            fadeInLogo()
            unScatterLabels()

            isScattered = false
        }
    }

    func getLocation() {
        let labels = [label1, label2, label2, label3, label4, label5, label6]
        for label in labels {
            guard let label = label else { return }
            self.labelLocations.append(label.center)
        }
    }


    func colorLabels() {
        let labels = [label1, label2, label2, label3, label4, label5, label6]
        let random = { CGFloat(Int.random(in: 0...255)) / 255.0 }
        for label in labels {
            guard let label = label else { return }

            label.textColor = UIColor(red: random(), green: random(), blue: random(), alpha: 0)
            label.backgroundColor = UIColor(red: random(), green: random(), blue: random(), alpha: 1)
            label.alpha = 0.60
            UIView.animate(withDuration: 4, delay: 0, options: .curveEaseIn, animations: {
                label.backgroundColor = UIColor(red: random(), green: random(), blue: random(), alpha: 1)
                label.textColor = UIColor(red: random(), green: random(), blue: random(), alpha: 1)
                label.alpha = 1
        })
    }
    }

    func unColorLabels() {
        let labels = [label1, label2, label2, label3, label4, label5, label6]
        for label in labels {
            guard let label = label else { return }
            label.alpha = 0.60
            UIView.animate(withDuration: 4, delay: 0, options: .curveLinear, animations: {
                label.textColor = .black
                label.backgroundColor = .white
                label.textColor = .black
                label.alpha = 1
            })
        }
    }

    func scatterLabels() {
        let labels = [label1, label2, label2, label3, label4, label5, label6]

        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
            for label in labels {
                guard let label = label else { return }
                let randInt = Int.random(in: -359...359)
                let randCGFloat = CGFloat(randInt)
            label.center = CGPoint(x: Int.random(in: 0...300), y: Int.random(in: 0...700))
            label.transform = CGAffineTransform(rotationAngle: randCGFloat.toRadians())
            }
        })
    }

    func unScatterLabels() {
        let labels = [label1, label2, label2, label3, label4, label5, label6]

        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            var count = 0
            for label in labels {
                guard let label = label else { return }
                label.center = self.labelLocations[count]
                label.transform = .identity
                count += 1
            }
        })
    }

    func fadeOutLogo() {
        UIView.animate(withDuration: 2) {
           self.lambdaLogo.alpha = 0
        }
    }
    func fadeInLogo() {
        UIView.animate(withDuration: 2) {
            self.lambdaLogo.alpha = 1
        }
    }

}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
