//
//  ViewController.swift
//  scatter-and-gather
//
//  Created by Hector Steven on 5/15/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var shouldScramble = false
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	@IBAction func toggle(_ sender: UIBarButtonItem) {
		shouldScramble.toggle()
		print(shouldScramble)
	}
	
}

