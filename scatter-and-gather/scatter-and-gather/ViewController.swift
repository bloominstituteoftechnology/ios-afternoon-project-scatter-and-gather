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
			let label = UILabel()
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = String(char)
			label.font = UIFont.boldSystemFont(ofSize: 60)
			label.backgroundColor = .red
			view.addSubview(label)
			labels.append(label)
			print(char)
		}
		
		let stackView = UIStackView()
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
	}
	
}

