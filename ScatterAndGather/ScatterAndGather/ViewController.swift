//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Bradley Yin on 8/14/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labels : [UILabel] = []
    
    weak var imageView: UIImageView!
    
    var isScattered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    func configureView() {
       
        let label1 = LetterLabel()
        label1.text = " L "
        labels.append(label1)
        
        let label2 = LetterLabel()
        label2.text = " a "
        labels.append(label2)
        
        let label3 = LetterLabel()
        label3.text = " m "
        labels.append(label3)
        
        let label4 = LetterLabel()
        label4.text = " b "
        labels.append(label4)
        
        let label5 = LetterLabel()
        label5.text = " d "
        labels.append(label5)
        
        let label6 = LetterLabel()
        label6.text = " a "
        labels.append(label6)
        
        let stackView = UIStackView(arrangedSubviews: [label1, label2, label3, label4, label5, label6])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30), stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100), stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)])
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.image = UIImage(named: "lambda_logo")
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30), imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50), imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50), imageView.heightAnchor.constraint(equalToConstant: 100)])
        self.imageView = imageView
        
        
    }
    @IBAction func toggleTapped(_ sender: Any) {
        if isScattered {
            gatherAnimation()
            isScattered = false
        }else {
            scatterAnimation()
            isScattered = true
        }
    }
    
    func scatterAnimation() {
        UIView.animate(withDuration: 3) {
            self.imageView.alpha = 0
            for label in self.labels {
                //label.transform = CGAffineTransform(translationX: 100, y: 100)
                label.textColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
                label.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
                label.transform = CGAffineTransform(rotationAngle: .random(in: -1...1)).translatedBy(x: .random(in: 1...400), y: .random(in: 1...700))
            }
 
        }
    }
    
    func gatherAnimation() {
        UIView.animate(withDuration: 3) {
            self.imageView.alpha = 1.0
            for label in self.labels {
                label.textColor = .black
                label.backgroundColor = .clear
                label.transform = .identity
            }
        }
       
        
    }
    

}

class LetterLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.3
        self.textAlignment = .center
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        self.font = self.font.withSize(30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
