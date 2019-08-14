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

	let labelStackView = UIStackView()

	// Making individual labels to spell "LAMBDA"
	let lLabel = UILabel()
	let aLabel = UILabel()
	let mLabel = UILabel()
	let bLabel = UILabel()
	let dlabel = UILabel()
	let lastALabel = UILabel()

	var labelArray: [UILabel] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.barTintColor = UIColor(red: 0.61, green: 0.06, blue: 0.16, alpha: 1.00)
		configureLabels()
		configureImageView()
	}

	func configureLabels() {
		lLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lLabel)
		lLabel.text = "L"
		lLabel.textAlignment = .center
		lLabel.font = .boldSystemFont(ofSize: 25)
		labelArray.append(lLabel)

		aLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(aLabel)
		aLabel.text = "A"
		aLabel.textAlignment = .center
		aLabel.font = .boldSystemFont(ofSize: 25)
		labelArray.append(aLabel)

		mLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(mLabel)
		mLabel.text = "M"
		mLabel.textAlignment = .center
		mLabel.font = .boldSystemFont(ofSize: 25)
		labelArray.append(mLabel)

		bLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(bLabel)
		bLabel.text = "B"
		bLabel.textAlignment = .center
		bLabel.font = .boldSystemFont(ofSize: 25)
		labelArray.append(bLabel)

		dlabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(dlabel)
		dlabel.text = "D"
		dlabel.textAlignment = .center
		dlabel.font = .boldSystemFont(ofSize: 25)
		labelArray.append(dlabel)

		lastALabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lastALabel)
		lastALabel.text = "A"
		lastALabel.textAlignment = .center
		lastALabel.font = .boldSystemFont(ofSize: 25)
		labelArray.append(lastALabel)

		[lLabel, aLabel, mLabel, bLabel, dlabel, lastALabel].forEach { labelStackView.addArrangedSubview($0) }

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
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 50).isActive = true
		imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
		imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
	}

	@IBAction func togglePressed(_ sender: UIBarButtonItem) {
		for label in labelArray {
			animate(label: label)
		}
	}

	func animate(label: UIView) {
		let bgColor = UIColor(red: .random(in: 0...1.00),
							  green: .random(in: 0...1.00),
							  blue: .random(in: 0...1.00),
							  alpha: 1.00)
		UIView.animate(withDuration: 2, delay: 0.0, options: [.repeat, .autoreverse], animations: {
			label.backgroundColor = bgColor
		}, completion: nil)
	}





}


