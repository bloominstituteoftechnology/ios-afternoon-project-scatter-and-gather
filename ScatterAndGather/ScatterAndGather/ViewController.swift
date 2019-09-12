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
		if isScattered {
			gather()
			labelReturn()
		} else {
			scatterLabels()
			textColorChange()
			randomBackgroundColor()
			rotateLetters()
		}
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
	
	func randomBackgroundColor() {
		
		let backgroundColor = CABasicAnimation(
			keyPath: #keyPath(CALayer.backgroundColor))
		
		backgroundColor.fromValue = Llabel.layer.backgroundColor
		backgroundColor.fromValue = aLabel.layer.backgroundColor
		backgroundColor.fromValue = mLabel.layer.backgroundColor
		backgroundColor.fromValue = bLabel.layer.backgroundColor
		backgroundColor.fromValue = dLabel.layer.backgroundColor
		backgroundColor.fromValue = a2Label.layer.backgroundColor
		
		let newBackgroundColor = randomColor()
		let newBackgroundColor1 = randomColor()
		let newBackgroundColor2 = randomColor()
		let newBackgroundColor3 = randomColor()
		let newBackgroundColor4 = randomColor()
		let newBackgroundColor5 = randomColor()
		
		backgroundColor.toValue = newBackgroundColor
		backgroundColor.duration = 1.5
		
		Llabel.layer.backgroundColor = newBackgroundColor
		aLabel.layer.backgroundColor = newBackgroundColor1
		mLabel.layer.backgroundColor = newBackgroundColor2
		bLabel.layer.backgroundColor = newBackgroundColor3
		dLabel.layer.backgroundColor = newBackgroundColor4
		a2Label.layer.backgroundColor = newBackgroundColor5
		
		Llabel.layer.add(backgroundColor, forKey: nil)
		aLabel.layer.add(backgroundColor, forKey: nil)
		mLabel.layer.add(backgroundColor, forKey: nil)
		bLabel.layer.add(backgroundColor, forKey: nil)
		dLabel.layer.add(backgroundColor, forKey: nil)
		a2Label.layer.add(backgroundColor, forKey: nil)
		
	}
	
	func textColorChange() {
		self.Llabel.textColor = UIColor(red: CGFloat.random(in: 0...255), green: CGFloat.random(in: 0...255), blue: CGFloat.random(in: 0...255), alpha: CGFloat.random(in: 0...1))
		self.aLabel.textColor = UIColor(red: CGFloat.random(in: 0...255), green: CGFloat.random(in: 0...255), blue: CGFloat.random(in: 0...255), alpha: CGFloat.random(in: 0...1))
		self.mLabel.textColor = UIColor(red: CGFloat.random(in: 0...255), green: CGFloat.random(in: 0...255), blue: CGFloat.random(in: 0...255), alpha: CGFloat.random(in: 0...1))
		self.bLabel.textColor = UIColor(red: CGFloat.random(in: 0...255), green: CGFloat.random(in: 0...255), blue: CGFloat.random(in: 0...255), alpha: CGFloat.random(in: 0...1))
		self.dLabel.textColor = UIColor(red: CGFloat.random(in: 0...255), green: CGFloat.random(in: 0...255), blue: CGFloat.random(in: 0...255), alpha: CGFloat.random(in: 0...1))
		self.a2Label.textColor = UIColor(red: CGFloat.random(in: 0...255), green: CGFloat.random(in: 0...255), blue: CGFloat.random(in: 0...255), alpha: CGFloat.random(in: 0...1))
	}
	
	func labelReturn() {
		UIView.animate(withDuration: 0.82) {
			self.Llabel.transform = .identity
			self.aLabel.transform = .identity
			self.mLabel.transform = .identity
			self.bLabel.transform = .identity
			self.dLabel.transform = .identity
			self.a2Label.transform = .identity
		}
	}
	
	func gather() {

		
		
	}
	
	func rotateLetters() {
		
		
		UIView.animate(withDuration: 2, animations: {
			// 45 degree roation
			self.Llabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 1.2, y: 3))
			self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 1.2, y: 3))
			self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 1.2, y: 3))
			self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 1.2, y: 3))
			self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 1.2, y: 3))
			self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 1.2, y: 3))

		}) { (isFinished) in
			UIView.animate(withDuration: 2, animations: {
				self.Llabel.transform = .identity
				self.aLabel.transform = .identity
				self.mLabel.transform = .identity
				self.bLabel.transform = .identity
				self.dLabel.transform = .identity
				self.a2Label.transform = .identity
			})
		}
	}

	private func randomColor() -> CGColor {
		let red = CGFloat.random(in: 0...255)
		let green = CGFloat.random(in: 0...255)
		let blue = CGFloat.random(in: 0...255)
		
		return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0).cgColor
	}
	
}

