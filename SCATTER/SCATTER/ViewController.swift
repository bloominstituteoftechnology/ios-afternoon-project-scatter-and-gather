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

		for subview in stackViewLetters.subviews {
			print(subview)
		}
	}

	@IBAction func togglePressed(_ sender: UIBarButtonItem) {
	}

}

