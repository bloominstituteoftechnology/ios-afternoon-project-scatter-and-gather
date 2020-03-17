//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Nichole Davidson on 3/17/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
        
    var lLabel = UILabel()
    var aLabel = UILabel()
    var mLabel = UILabel()
    var bLabel = UILabel()
    var dLabel = UILabel()
    var aEndLabel = UILabel()
    var imageView = UIImageView()
    
    var lambdaLogo: UIImage! {
        
            UIImage(named: "lambda_logo")
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubViews()
    }
    
    func viewDidLoad(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      
    }
    
    func setUpSubViews() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = true
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        UIImageView.animate(withDuration: 5) {
            self.imageView.alpha = 0
        }
        
        view.addSubview(lLabel)
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        lLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        lLabel.text = "L"
        lLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        lLabel.backgroundColor = .cyan
        lLabel.textColor = .blue
        
        view.addSubview(aLabel)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        aLabel.text = "A"
        aLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        aLabel.backgroundColor = .blue
        aLabel.textColor = .cyan
        
        view.addSubview(mLabel)
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        mLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        mLabel.text = "M"
        mLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        mLabel.backgroundColor = .cyan
        mLabel.textColor = .blue
        
        view.addSubview(bLabel)
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        bLabel.text = "B"
        bLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        bLabel.backgroundColor = .blue
        bLabel.textColor = .cyan
        
        view.addSubview(dLabel)
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        dLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        dLabel.text = "D"
        dLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        dLabel.backgroundColor = .cyan
        dLabel.textColor = .blue
        
        view.addSubview(aEndLabel)
        aEndLabel.translatesAutoresizingMaskIntoConstraints = false
        aEndLabel.widthAnchor.constraint(equalTo: lLabel.heightAnchor).isActive = true
        aEndLabel.text = "A"
        aEndLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        aEndLabel.backgroundColor = .blue
        aEndLabel.textColor = .cyan
        
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
        
        imageView.center = view.center
        
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
