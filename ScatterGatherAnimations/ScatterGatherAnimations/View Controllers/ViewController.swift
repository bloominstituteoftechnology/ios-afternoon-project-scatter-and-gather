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
		setupSubViews()
		setupNavigationBar()
		
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


	private func setupSubViews() {

		// Setup the toogle switch in the nagivation bar

		let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))

		self.navigationItem.rightBarButtonItem = toggleButton

		// Setup the labels in the view

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


		let stackView = UIStackView(arrangedSubviews: [lLabel,
													   aaLabel,
													   mLabel,
													   bLabel,
													   dLabel,
													   aLabel])

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




	// MARK: - Actions

	@objc func toggleButtonPressed() {

		if self.isScattered {

			UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {

				let minimumXCoordinate = Int(self.view.bounds.minX)
				let maximumXCoordinate = Int(self.view.bounds.maxX - 10)

				let minimumYCoordinate = Int(self.view.bounds.minY)
				let maximumYCoordiante = Int(self.view.bounds.maxY - 10)

				UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations:{ self.logoImage.alpha = 0 })

				UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {

					let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
					let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

					let newCenter = CGPoint(x: X, y: Y)

					self.lLabel.center = newCenter
					self.lLabel.textColor = self.randomColor()
					self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
					self.lLabel.alpha = 0
					//self.backToStart(label: self.lLabel)
				})

				UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {

					let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
					let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

					let newCenter = CGPoint(x: X, y: Y)

					self.aaLabel.center = newCenter
					self.aaLabel.textColor = self.randomColor()
					self.aaLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
					self.aaLabel.alpha = 0
				})

				UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {

					let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
					let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

					let newCenter = CGPoint(x: X, y: Y)

					self.mLabel.center = newCenter
					self.mLabel.textColor = self.randomColor()
					self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
					self.mLabel.alpha = 0
				})

				UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {

					let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
					let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

					let newCenter = CGPoint(x: X, y: Y)

					self.bLabel.center = newCenter
					self.bLabel.textColor = self.randomColor()
					self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
					self.bLabel.alpha = 0
				})

				UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {

					let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
					let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

					let newCenter = CGPoint(x: X, y: Y)

					self.dLabel.center = newCenter
					self.dLabel.textColor = self.randomColor()
					self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
					self.dLabel.alpha = 0
				})

				UIView.addKeyframe(withRelativeStartTime: Double.random(in: 0...0.5), relativeDuration: 1, animations: {

					let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
					let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

					let newCenter = CGPoint(x: X, y: Y)

					self.aLabel.center = newCenter
					self.aLabel.textColor = self.randomColor()
					self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
					self.aLabel.alpha = 0
				})










			}, completion: nil)
		}

	}

	private func setupNavigationBar() {

		navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
		navigationController?.navigationBar.barTintColor = randomColor()
		
	}

	private func backToStart(label: UILabel) {

		UIView.animate(withDuration: 4) {
			label.transform = .identity
			label.alpha = 1
		}
	}

	private func randomColor() -> UIColor {

		var random: UIColor {

			let red: CGFloat = .random(in: 0...255)
			let green: CGFloat = .random(in: 0...255)
			let blue: CGFloat = .random(in: 0...255)

			return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)

		}
		return random
	}






}



