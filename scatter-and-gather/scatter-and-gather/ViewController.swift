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
		let labelscpy = labels
		for (i, label) in labelscpy.enumerated() {
			let x = label.center.x
			let y = label.center.y
			
			
			UIView.animate(withDuration: 2, animations: {
				if self.shouldScramble {
					label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
					label.center = CGPoint(x: label.center.x - 100, y:  label.center.y + 300)
				}
			}) { _ in
				
//				if !self.shouldScramble {
					UIView.animate(withDuration: 2, animations: {
//						label.transform = .identity
						
						label.center = CGPoint(x: x, y: y)
						label.transform = .identity
					})
//				}

			}
			
		
	}
	
}

}
