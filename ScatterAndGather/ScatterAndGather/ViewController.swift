//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Percy Ngan on 10/8/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Outlets
	var letterL = UILabel()
	var letterA = UILabel()
	var letterM = UILabel()
	var letterB = UILabel()
	var letterD = UILabel()
	var letterA2 = UILabel()
	var lambdaImage = UIImageView()

	// MARK: - Properties
	var isScattered: Bool = false
	let toggleButton = UIBarButtonItem()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupSubviews()

	}

	// MARK: - Setup Subviews
	func setupSubviews() {

		let toggleButton = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonPressed))
		self.navigationItem.rightBarButtonItem = toggleButton

		//Setup the letter labels in the view
		let letterL = UILabel()
		letterL.text = "L"
		//let letterL = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 10))
		letterL.translatesAutoresizingMaskIntoConstraints = false
		letterL.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
		view.addSubview(letterL)

		self.letterL = letterL

		let letterA = UILabel()
		letterA.text = "A"
		//let letterL = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 10))
		letterA.translatesAutoresizingMaskIntoConstraints = false
		letterA.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
		view.addSubview(letterA)

		self.letterA = letterA

		let letterM = UILabel()
		letterM.text = "M"
		//let letterL = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 10))
		letterM.translatesAutoresizingMaskIntoConstraints = false
		letterM.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
		view.addSubview(letterM)

		self.letterM = letterM

		let letterB = UILabel()
		letterB.text = "B"
		//let letterL = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 10))
		letterB.translatesAutoresizingMaskIntoConstraints = false
		letterB.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
		view.addSubview(letterB)

		self.letterB = letterB

		let letterD = UILabel()
		letterD.text = "D"
		//let letterL = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 10))
		letterD.translatesAutoresizingMaskIntoConstraints = false
		letterD.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
		view.addSubview(letterD)

		self.letterD = letterD

		let letterA2 = UILabel()
		letterA2.text = "A"
		//let letterL = UILabel(frame: CGRect(x: 30, y: 30, width: 10, height: 10))
		letterA2.translatesAutoresizingMaskIntoConstraints = false
		letterA2.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
		view.addSubview(letterA2)

		self.letterA2 = letterA2


		let stackView = UIStackView(arrangedSubviews: [letterL,
													   letterA,
													   letterM,
													   letterB,
													   letterD,
													   letterA2
			])

		view.addSubview(stackView)
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing

		// Stackview constraints
		stackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
			])


		lambdaImage.image = #imageLiteral(resourceName: "lambda_logo")
		lambdaImage.translatesAutoresizingMaskIntoConstraints = false
		lambdaImage.contentMode = .scaleAspectFit
		view.addSubview(lambdaImage)

		NSLayoutConstraint.activate([

			lambdaImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
			lambdaImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			lambdaImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)])

	} // End of setupSubviews func




	// MARK: - Actions

	// MARK: - Functions
	@objc func toggleButtonPressed() {

		if isScattered == true {
			scatterLetters()
			isScattered = false
		} else {
			gatherLetters()
			isScattered = true
		}
	}

	func scatterLetters() {

		UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {

			let minimumXCoordinate = Int(self.view.bounds.minX)
			let maximumXCoordinate = Int(self.view.bounds.maxX - 10)

			let minimumYCoordinate = Int(self.view.bounds.minY)
			let maximumYCoordiante = Int(self.view.bounds.maxY - 10)

			UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations:{ self.lambdaImage.alpha = 0 })

			UIView.addKeyframe(withRelativeStartTime: .random(in: 0...1), relativeDuration: 1, animations: {

				let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
				let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

				let center2 = CGPoint(x: X, y: Y)

				self.letterL.center = center2
				self.letterL.alpha = 0
				self.letterL.textColor = self.randomColor()
				self.letterL.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))

			})

			UIView.addKeyframe(withRelativeStartTime:.random(in: 0...0.1), relativeDuration: 1, animations: {

				let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
				let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

				let center2 = CGPoint(x: X, y: Y)

				self.letterA.center = center2
				self.letterA.alpha = 0
				self.letterA.textColor = self.randomColor()
				self.letterA.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))
			})

			UIView.addKeyframe(withRelativeStartTime: .random(in: 0...1), relativeDuration: 1, animations: {

				let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
				let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

				let newCenter = CGPoint(x: X, y: Y)

				self.letterM.center = newCenter
				self.letterM.alpha = 0
				self.letterM.textColor = self.randomColor()
				self.letterM.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))

			})

			UIView.addKeyframe(withRelativeStartTime: .random(in: 0...0.1), relativeDuration: 1, animations: {

				let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
				let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

				let newCenter = CGPoint(x: X, y: Y)

				self.letterB.center = newCenter
				self.letterB.alpha = 0
				self.letterB.textColor = self.randomColor()
				self.letterB.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))

			})

			UIView.addKeyframe(withRelativeStartTime: .random(in: 0...1), relativeDuration: 1, animations: {

				let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
				let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

				let newCenter = CGPoint(x: X, y: Y)

				self.letterD.center = newCenter
				self.letterD.alpha = 0
				self.letterD.textColor = self.randomColor()
				self.letterD.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))

			})

			UIView.addKeyframe(withRelativeStartTime: .random(in: 0...0.1), relativeDuration: 1, animations: {

				let X = Int.random(in: minimumXCoordinate...maximumXCoordinate)
				let Y = Int.random(in: minimumYCoordinate...maximumYCoordiante)

				let newCenter = CGPoint(x: X, y: Y)

				self.letterA2.center = newCenter
				self.letterA2.alpha = 0
				self.letterA2.textColor = self.randomColor()
				self.letterA2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in:  -2 * CGFloat.pi...2 * CGFloat.pi))

			})
		}, completion: nil)
	}

	func gatherLetters() {

		UIView.animate(withDuration: 4) {

			self.letterL.center = CGPoint(x: 12, y: 20)
			self.letterL.alpha = 1
			self.letterL.textColor = .black
			self.letterL.transform = .identity
		}

		UIView.animate(withDuration: 4) {

			self.letterA2.center = CGPoint(x: 72.25, y: 20)
			self.letterA2.alpha = 1
			self.letterA2.textColor = .black
			self.letterA2.transform = .identity
		}

		UIView.animate(withDuration: 4) {

			self.letterM.center = CGPoint(x: 141.5, y: 20)
			self.letterM.alpha = 1
			self.letterM.textColor = .black
			self.letterM.transform = .identity
		}

		UIView.animate(withDuration: 4) {

			self.letterB.center = CGPoint(x: 208.75, y: 20)
			self.letterB.alpha = 1
			self.letterB.textColor = .black
			self.letterB.transform = .identity
		}

		UIView.animate(withDuration: 4) {

			self.letterD.center = CGPoint(x: 274, y: 20)
			self.letterD.alpha = 1
			self.letterD.textColor = .black
			self.letterD.transform = .identity
		}

		UIView.animate(withDuration: 4) {

			self.letterA.center = CGPoint(x: 339.25, y: 20)
			self.letterA.alpha = 1
			self.letterA.textColor = .black
			self.letterA.transform = .identity
		}

		UIView.animate(withDuration: 4) {

			self.lambdaImage.alpha = 1

		}
	}


	func randomColor() -> UIColor {

		var random: UIColor {

			let red: CGFloat = .random(in: 0...255)
			let green: CGFloat = .random(in: 0...255)
			let blue: CGFloat = .random(in: 0...255)

			return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)

		}
		return random
	}
} // End of class





