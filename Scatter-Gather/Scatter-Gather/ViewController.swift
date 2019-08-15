//
//  ViewController.swift
//  Scatter-Gather
//
//  Created by Marlon Raskin on 8/14/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Properties

	var isScattered: Bool = false

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	let labelStackView = UIStackView()

	let lLabel = GenericLabel(text: "L")
	let aLabel = GenericLabel(text: "A")
	let mLabel = GenericLabel(text: "M")
	let bLabel = GenericLabel(text: "B")
	let dlabel = GenericLabel(text: "D")
	let lastALabel = GenericLabel(text: "A")
	let imageView = UIImageView()

	var labelArray: [UILabel] = []



	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.barTintColor = UIColor(red: 0.61, green: 0.06, blue: 0.16, alpha: 1.00)
		configureLabels()
		configureImageView()
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onTapAndHoldImageView))
		imageView.addGestureRecognizer(panGesture)

	}


	// MARK: - Configure Views

	func configureLabels() {
		[lLabel, aLabel, mLabel, bLabel, dlabel, lastALabel].forEach {
			view.addSubview($0)
			labelArray.append($0)
			labelStackView.addArrangedSubview($0)
		}

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
		imageView.image = UIImage(named: "lambda_logo")
		imageView.contentMode = .scaleAspectFit
		imageView.isUserInteractionEnabled = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 50).isActive = true
		imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
		imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
	}

	var initialPoint: CGPoint?

	@objc func onTapAndHoldImageView(recognizer: UIPanGestureRecognizer) {
		if let view = recognizer.view {
			if recognizer.state == .began {
				initialPoint = view.center
			} else if recognizer.state == .ended {
				guard let initialPoint = initialPoint else { return }
				UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 1.0, options: [.curveEaseOut], animations: {
					view.center = initialPoint
				}, completion: nil)
				return
			}

			let translation = recognizer.translation(in: view)
			view.center =  CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
			recognizer.setTranslation(.zero, in: view)
		}
	}


	// MARK: - IBActions

	@IBAction func togglePressed(_ sender: UIBarButtonItem) {
		if isScattered {
			for label in labelArray {
				deAnimate(label: label)
			}
			deAnimateImage(image: imageView)
		} else {
			for label in labelArray {
				animate(label: label)
			}
			animateImage(image: imageView)
		}
	}


	// MARK: - Animation Functions

	func animate(label: UIView) {
		isScattered = true
		let bgColor = UIColor(red: .random(in: 0...1.00),
							  green: .random(in: 0...1.00),
							  blue: .random(in: 0...1.00),
							  alpha: 0)
		UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 2.0, options: [], animations: {
			label.layer.backgroundColor = bgColor.withAlphaComponent(1.00).cgColor
			label.transform = CGAffineTransform(translationX: .random(in: -20...350), y: .random(in: -100...200))
								.concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / 2))
								.concatenating(CGAffineTransform(scaleX: 2.4, y: 1.7))
		}, completion: nil)
	}

	func deAnimate(label: UIView) {
		isScattered = false
		let bgColor = UIColor(red: .random(in: 0...1.00),
							  green: .random(in: 0...1.00),
							  blue: .random(in: 0...1.00),
							  alpha: 1.00)
		UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 1.0, options: [], animations: {
			label.layer.backgroundColor = bgColor.withAlphaComponent(0.0).cgColor
			label.transform = .identity
		}, completion: nil)
	}


	func animateImage(image: UIImageView) {
		UIView.animate(withDuration: 0.3) {
			image.transform = CGAffineTransform(translationX: 0.0, y: 700.0)
//			image.transform = CGAffineTransform(scaleX: 500, y: 700)
			image.alpha = 0.00
		}
	}

	func deAnimateImage(image: UIImageView) {
		UIView.animate(withDuration: 1.2, delay: 0.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 2.0, options: .curveEaseOut, animations: {
			image.alpha = 1.00
			image.transform = .identity
		}, completion: nil)
	}
}


