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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		createLabels()
	}
	
	func createLabels() {
		let str = Array("LAMBDA")
		for char in str {
			let label = UILabel(frame: CGRect(x: 8, y: 0, width: 40, height: 40))
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = String(char)
			
			view.addSubview(label)
			labels.append(label)
			print(char)
		}
		
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stackView)
		
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		
		labels.forEach( {
			stackView.addArrangedSubview( $0 )
		})
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			
			])
		
	}
	

	@IBAction func toggle(_ sender: UIBarButtonItem) {
		shouldScramble.toggle()
		print(shouldScramble)
	}
	
}

