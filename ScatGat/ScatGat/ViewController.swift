//
//  ViewController.swift
//  ScatGat
//
//  Created by Jeffrey Santana on 8/14/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: - IBOutlets
	
	
	//MARK: - Properties
	
	var letterLbls = [UILabel]()
	var isScattered = false
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configLabels()
	}
	
	//MARK: - IBActions
	
	@IBAction func toggleButtonPressed(_ sender: Any) {
	}
	
	//MARK: - Helpers
	
	private func configLabels() {
		let subject = "Lambda".map{$0}
		
		for index in 0..<subject.count {
			let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
			
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = subject[index].description
			label.textAlignment = .center
			label.font = UIFont(name: label.font.fontName, size: 50)
			label.tag = index
			
			view.addSubview(label)
			letterLbls.append(label)
		}
		
		let stackView = UIStackView(arrangedSubviews: letterLbls)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.distribution = .fillEqually
		
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
				stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
				stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
				stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
				stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
			])
	}
	
}

