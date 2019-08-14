//
//  ViewController.swift
//  Scatter-Gather
//
//  Created by Marlon Raskin on 8/14/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var isScattered: Bool = false
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureLabels()
	}

	func configureLabels() {
		let lLabel = UILabel()
		lLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lLabel)
		lLabel.text = "L"
		lLabel.textAlignment = .center
		lLabel.font = .boldSystemFont(ofSize: 25)

		let aLabel = UILabel()
		aLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(aLabel)
		aLabel.text = "A"
		aLabel.textAlignment = .center
		aLabel.font = .boldSystemFont(ofSize: 25)

		let mLabel = UILabel()
		mLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(mLabel)
		mLabel.text = "M"
		mLabel.textAlignment = .center
		mLabel.font = .boldSystemFont(ofSize: 25)

		let bLabel = UILabel()
		bLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(bLabel)
		bLabel.text = "B"
		bLabel.textAlignment = .center
		bLabel.font = .boldSystemFont(ofSize: 25)

		let dlabel = UILabel()
		dlabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(dlabel)
		dlabel.text = "D"
		dlabel.textAlignment = .center
		dlabel.font = .boldSystemFont(ofSize: 25)

		let lastALabel = UILabel()
		lastALabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lastALabel)
		lastALabel.text = "A"
		lastALabel.textAlignment = .center
		lastALabel.font = .boldSystemFont(ofSize: 25)

		let labelStackView = UIStackView(arrangedSubviews: [lLabel, aLabel, mLabel, bLabel, dlabel, lastALabel])

		labelStackView.translatesAutoresizingMaskIntoConstraints = false
		labelStackView.axis = .horizontal
		labelStackView.distribution = .equalSpacing
		labelStackView.spacing = 20
		view.addSubview(labelStackView)

		NSLayoutConstraint.activate([
			labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
			labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
			])

	}

	func configureImageView() {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "lambda_logo")
	}

	@IBAction func togglePressed(_ sender: UIBarButtonItem) {
	}

}


