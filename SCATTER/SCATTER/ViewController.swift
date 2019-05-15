//
//  ViewController.swift
//  SCATTER
//
//  Created by Michael Redig on 5/15/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var shouldScramble = true

	@IBOutlet var stackViewLetters: UIStackView!

	@IBOutlet var logoView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.


	}

	@IBAction func togglePressed(_ sender: UIBarButtonItem) {
		let duration = TimeInterval.random(in: 2...4)
		let myCompleter = { (_: Bool) in
			sender.isEnabled = true
		}
		sender.isEnabled = false

		if shouldScramble {
			//crazy animation
			UIView.animate(withDuration: duration, animations: { [weak self] in
				self?.logoView.alpha = 0
			}, completion: myCompleter)

			animateCrazy(withDuration: duration)

		} else {
			UIView.animate(withDuration: duration, animations: { [weak self] in
				self?.logoView.alpha = 1
			}, completion: myCompleter)

			for letter in stackViewLetters.subviews {
				guard let letter = letter as? UILabel else { return }
				UIView.animate(withDuration: duration, animations: {
					letter.transform = .identity
					letter.layer.backgroundColor = UIColor.clear.cgColor
				})
				
				let changeColor = CATransition()
				changeColor.duration = duration
				CATransaction.begin()
				CATransaction.setCompletionBlock {
					letter.layer.add(changeColor, forKey: nil)
					letter.textColor = .black
				}
				CATransaction.commit()
			}
		}
		shouldScramble.toggle()
	}

	private func animateCrazy(withDuration duration: TimeInterval, completion: ((Bool) -> Void)? = nil) {
		for letter in stackViewLetters.subviews {
			guard let letter = letter as? UILabel else { return }
			UIView.animate(withDuration: duration, animations: { [weak self] in
				guard let self = self else { return }
				let x = CATransform3DMakeRotation(CGFloat.random(in: 0..<CGFloat.pi), 1, 0, 0)
				let y = CATransform3DMakeRotation(CGFloat.random(in: 0..<CGFloat.pi), 0, 1, 0)
				let z = CATransform3DMakeRotation(CGFloat.random(in: 0..<CGFloat.pi), 0, 0, 1)
				let xy = CATransform3DConcat(x, y)
				let xyzRot = CATransform3DConcat(xy, z)

				let xTrans: CGFloat = CGFloat.random(in: self.view.bounds.minX...self.view.bounds.maxX)
				let yTrans: CGFloat = CGFloat.random(in: self.view.bounds.minY...self.view.bounds.maxY)
				let localLocation = self.view.convert(CGPoint(x: xTrans, y: yTrans), to: letter)

				let trans = CATransform3DMakeTranslation(localLocation.x, localLocation.y, 0)
				let total = CATransform3DConcat(xyzRot, trans)
				print(self.view.bounds.minX...self.view.bounds.maxX, xTrans, yTrans)
				letter.layer.transform = total
				letter.layer.backgroundColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0.25...1), brightness: CGFloat.random(in: 0...1), alpha: 1).cgColor
			})

			let changeColor = CATransition()
			changeColor.duration = duration
			CATransaction.begin()
			CATransaction.setCompletionBlock {
				letter.layer.add(changeColor, forKey: nil)
				letter.textColor = UIColor(hue: CGFloat.random(in: 0..<1), saturation: CGFloat.random(in: 0.25...1), brightness: CGFloat.random(in: 0.5...1), alpha: 1)
			}
			CATransaction.commit()
		}
	}
}

