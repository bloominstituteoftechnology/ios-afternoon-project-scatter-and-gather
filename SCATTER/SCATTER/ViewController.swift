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
		print(sender.isEnabled)

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
				UIView.animate(withDuration: duration, animations: {
					letter.transform = .identity
				})
			}
		}
		shouldScramble.toggle()
	}

	private func animateCrazy(withDuration duration: TimeInterval, completion: ((Bool) -> Void)? = nil) {

	}

}

