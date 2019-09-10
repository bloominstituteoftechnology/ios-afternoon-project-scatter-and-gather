//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Taylor Lyles on 9/10/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var Llabel: UILabel!
	@IBOutlet weak var aLabel: UILabel!
	@IBOutlet weak var mLabel: UILabel!
	@IBOutlet weak var bLabel: UILabel!
	@IBOutlet weak var dLabel: UILabel!
	@IBOutlet weak var a2Label: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	
	var isScattered: Bool = false

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func toggleButtonPressed(_ sender: Any) {
		
		scatterLabels()
		
	}
	
	func scatterLabels() {
		UIView.animate(withDuration: 2) {
			self.imageView.alpha = 0
		}
		
		self.Llabel.transform = CGAffineTransform(translationX: .random(in: 0...300), y: .random(in: 0...300))
		self.aLabel.transform = CGAffineTransform(translationX: .random(in: 0...300), y: .random(in: 0...300))
		self.mLabel.transform = CGAffineTransform(translationX: .random(in: 0...300), y: .random(in: 0...300))
		self.bLabel.transform = CGAffineTransform(translationX: .random(in: 0...300), y: .random(in: 0...300))
		self.dLabel.transform = CGAffineTransform(translationX: .random(in: 0...300), y: .random(in: 0...300))
		self.a2Label.transform = CGAffineTransform(translationX: .random(in: 0...300), y: .random(in: 0...300))
		
		UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
			self.Llabel.transform = .identity
			self.aLabel.transform = .identity
			self.mLabel.transform = .identity
			self.bLabel.transform = .identity
			self.dLabel.transform = .identity
			self.a2Label.transform = .identity

			
		}, completion: nil)

		
	}
}

