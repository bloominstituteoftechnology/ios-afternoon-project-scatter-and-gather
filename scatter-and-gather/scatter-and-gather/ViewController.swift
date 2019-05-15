//
//  ViewController.swift
//  scatter-and-gather
//
//  Created by Hector Steven on 5/15/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var shouldScramble = false
	var labels: [UILabel] = []
	
	var stackView = UIStackView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		createLabels()
		createImageView()
	}
	
	private func createImageView() {
		
		let imageview = UIImageView(image: #imageLiteral(resourceName: "Lambda_Logo"))
		imageview.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(imageview)
		NSLayoutConstraint.activate([
			
			imageview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
			imageview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
			imageview.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
			imageview.heightAnchor.constraint(equalToConstant: 100)
			
			])
		
	}
	
	private func createLabels() {
		let str = Array("LAMBDA")
		for char in str {
			let label = UILabel()
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = String(char)
			label.font = UIFont.boldSystemFont(ofSize: 60)
			
			view.addSubview(label)
			labels.append(label)
		}
		
		stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stackView)
		
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		stackView.spacing = 4
		labels.forEach( {
			stackView.addArrangedSubview( $0 )
		})
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			
			])
		
	}
	

	@IBAction func toggle(_ sender: UIBarButtonItem) {
		shouldScramble.toggle()
		print(shouldScramble)
		
		
		for label in labels {
			UIView.animateKeyframes(withDuration: 5, delay: 0, options: [], animations: {
				
				UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
					label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
				})
				
				UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
					label.transform = .identity
				})
				
				UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
					label.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
				})
				
				UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
					label.center = self.view.center
				})
			
			}, completion: {
				_ in
				label.transform = .identity
			})
		}
		
	}
	
}

