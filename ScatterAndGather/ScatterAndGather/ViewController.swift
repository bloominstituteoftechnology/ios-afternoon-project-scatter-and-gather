//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Tobi Kuyoro on 21/01/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Properties
    
    var isScattered: Bool = false
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK:- View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureImage()
        configureLabels()
        
    }
    
    func configureLabels() {
        // L Label
        let lLabel = UILabel()
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont.systemFont(ofSize: 72)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lLabel)
        
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        
        self.lLabel = lLabel
        
        //A1 Label
        let a1Label = UILabel()
        a1Label.text = "a"
        a1Label.textAlignment = .center
        a1Label.font = UIFont.systemFont(ofSize: 72)
        a1Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(a1Label)
        
        a1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        a1Label.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 15).isActive = true
        
        self.a1Label = a1Label
        
        //M Label
        let mLabel = UILabel()
        mLabel.text = "m"
        mLabel.textAlignment = .center
        mLabel.font = UIFont.systemFont(ofSize: 72)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: a1Label.trailingAnchor, constant: 15).isActive = true
        
        self.mLabel = mLabel
        
        //B Label
        let bLabel = UILabel()
        bLabel.text = "b"
        bLabel.textAlignment = .center
        bLabel.font = UIFont.systemFont(ofSize: 72)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bLabel)
        
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 15).isActive = true
        
        self.bLabel = bLabel
        
        //D Label
        let dLabel = UILabel()
        dLabel.text = "d"
        dLabel.textAlignment = .center
        dLabel.font = UIFont.systemFont(ofSize: 72)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dLabel)
        
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 15).isActive = true
        
        self.dLabel = dLabel
        
        //A2 Label
        let a2Label = UILabel()
        a2Label.text = "a"
        a2Label.textAlignment = .center
        a2Label.font = UIFont.systemFont(ofSize: 72)
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(a2Label)
        
        a2Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        a2Label.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 15).isActive = true
        
        self.a2Label = a2Label
    }
    
    func configureImage() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 2.5)
        ])
        
        imageView.image = UIImage(named: "lambda_logo")
        
        self.imageView = imageView
    }
    
    // MARK:- Actions
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        imageAnimation()
    }
    
    func imageAnimation() {        
        UIView.animate(withDuration: 3, animations: {
            self.imageView.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 3, animations: {
                self.imageView.alpha = 1.0
            })
    }
    
    func labelAnimations() {
        
    }
}
}
