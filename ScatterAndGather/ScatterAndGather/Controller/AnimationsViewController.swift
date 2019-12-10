//
//  AnimationsViewController.swift
//  ScatterAndGather
//
//  Created by Chad Rutherford on 12/10/19.
//  Copyright © 2019 lambdaschool.com. All rights reserved.
//

import UIKit
import SwiftUI

class AnimationsViewController: UIViewController {
    
    var isScattered: Bool = false
    
    let schoolLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "lambda_logo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let lLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let aLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "a"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let mLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "m"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let bLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "b"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let dLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "d"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    let aEndLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "a"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSchoolLogo()
        configureLambdaLabels()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(handleToggle))
    }
    
    @objc private func handleToggle() {
        isScattered.toggle()
    }
    
    /// Constraints needed:   X,    Y,     Width,     Height
    private func configureSchoolLogo() {
        view.addSubview(schoolLogo)
        schoolLogo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        schoolLogo.heightAnchor.constraint(equalTo: schoolLogo.widthAnchor, multiplier: 0.5).isActive = true
        schoolLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        schoolLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func configureLambdaLabels() {
        view.addSubview(lLabel)
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6).isActive = true
        lLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        lLabel.heightAnchor.constraint(equalTo: lLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(aLabel)
        aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant: 10).isActive = true
        aLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        aLabel.heightAnchor.constraint(equalTo: aLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(mLabel)
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant: 10).isActive = true
        mLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        mLabel.heightAnchor.constraint(equalTo: mLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(bLabel)
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant: 10).isActive = true
        bLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        bLabel.heightAnchor.constraint(equalTo: bLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(dLabel)
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant: 10).isActive = true
        dLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        dLabel.heightAnchor.constraint(equalTo: dLabel.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(aEndLabel)
        aEndLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        aEndLabel.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant: 10).isActive = true
        aEndLabel.widthAnchor.constraint(equalToConstant: (view.bounds.size.width / 6) - 10).isActive = true
        aEndLabel.heightAnchor.constraint(equalTo: aEndLabel.widthAnchor, multiplier: 1).isActive = true
    }
}

struct AnimationsPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: AnimationsPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AnimationsPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AnimationsPreview.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: AnimationsViewController())
        }
    }
}
