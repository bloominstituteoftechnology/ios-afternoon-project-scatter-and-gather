//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Nichole Davidson on 3/17/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
        
    var lLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var aEndLabel = UILabel()
    var imageView = UIImageView(image: UIImage(named: "lambda_logo"))
    
//    var lambdaLogo: UIImage! {
//
//            UIImage(named: "lambda_logo")
//        }
    
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureObjects()
    }
    
    func viewDidLoad(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      
    }
    
    // MARK: - Private
    
    private func configureObjects() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 3, constant: 1).isActive = true
        
        
        view.addSubview(lLabel)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        lLabel.text = "L"
        lLabel.textAlignment = .center
        lLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        lLabel.textColor = .black
        
        view.addSubview(aLabel)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        aLabel.text = "A"
        aLabel.textAlignment = .center
        aLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        aLabel.textColor = .black
        
        view.addSubview(mLabel)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        mLabel.text = "M"
        mLabel.textAlignment = .center
        mLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        mLabel.textColor = .black
        
        view.addSubview(bLabel)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        bLabel.text = "B"
        bLabel.textAlignment = .center
        bLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        bLabel.textColor = .black
        
        view.addSubview(dLabel)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        dLabel.text = "D"
        dLabel.textAlignment = .center
        dLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        dLabel.textColor = .black
        
        view.addSubview(aEndLabel)
        aEndLabel.translatesAutoresizingMaskIntoConstraints = false
        aEndLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        aEndLabel.text = "A"
        aEndLabel.textAlignment = .center
        aEndLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 50)
        aEndLabel.textColor = .black
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(lLabel)
        stackView.addArrangedSubview(aLabel)
        stackView.addArrangedSubview(mLabel)
        stackView.addArrangedSubview(bLabel)
        stackView.addArrangedSubview(dLabel)
        stackView.addArrangedSubview(aEndLabel)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
            
        ])
        
        
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        var isScattered: Bool = true
        isScattered.toggle()
        
        
        UIImageView.animate(withDuration: 5) {
            self.imageView.alpha = 0
        }
        
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
