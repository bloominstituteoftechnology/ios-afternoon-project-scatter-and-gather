//
//  ViewController.swift
//  ScatterGatherAnimations
//
//  Created by Percy Ngan on 9/10/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Outlets

	private var lLabel: UILabel!
	private var aaLabel: UILabel!
	private var mLabel: UILabel!
	private var bLabel: UILabel!
	private var dLabel: UILabel!
	private var aLabel: UILabel!
	private var logoImage: UIImageView!
	private var stackView: UIStackView!


	// MARK: - Properties

	var isScattered: Bool = true


	override func viewDidLoad() {
		super.viewDidLoad()

		initializeViews()
		//setUpSubViews()
		configureLabels()
		
	}


	// MARK: - Setup Subviews

	private func initializeViews() {

		lLabel = UILabel()
		aaLabel = UILabel()
		mLabel = UILabel()
		bLabel = UILabel()
		dLabel = UILabel()
		aLabel = UILabel()
		logoImage = UIImageView()

	}


	private func configureLabels() {

		lLabel.translatesAutoresizingMaskIntoConstraints = false
		lLabel.text = "L"
		lLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)


		view.addSubview(lLabel)


		aaLabel.translatesAutoresizingMaskIntoConstraints = false
		aaLabel.text = "A"
		aaLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)


		view.addSubview(aaLabel)


		mLabel.translatesAutoresizingMaskIntoConstraints = false
		mLabel.text = "M"
		mLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)


		view.addSubview(mLabel)


		bLabel.translatesAutoresizingMaskIntoConstraints = false
		bLabel.text = "B"
		bLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)


		view.addSubview(bLabel)


		dLabel.translatesAutoresizingMaskIntoConstraints = false
		dLabel.text = "D"
		dLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)


		view.addSubview(dLabel)


		aLabel.translatesAutoresizingMaskIntoConstraints = false
		aLabel.text = "A"
		aLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)


		view.addSubview(aLabel)


		let stackView = UIStackView(arrangedSubviews: [lLabel, aaLabel, mLabel, bLabel, dLabel, aLabel])

		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing

		view.addSubview(stackView)

		stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
		stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
		stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true


		logoImage.image = #imageLiteral(resourceName: "lambda_logo.png")
		logoImage.translatesAutoresizingMaskIntoConstraints = false
		logoImage.backgroundColor = .clear
		logoImage.contentMode = .scaleAspectFit

		view.addSubview(logoImage)

		logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
		logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
		logoImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
		// TODO: See if the heightAnchor makes a difference for aspectRatio
		//logoImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1, constant: 0).isActive = true


	}




	//@IBOutlet weak var toogleButtonPressed: UIImageView!


}



