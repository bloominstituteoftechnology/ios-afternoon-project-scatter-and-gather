//
//  ViewController.swift
//  ScatGat
//
//  Created by Jeffrey Santana on 8/14/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var toggleBtn: UIBarButtonItem!
	
	//MARK: - Properties
	
	var logoImgView: UIImageView!
	var letterStackView: UIStackView!
	var letterLbls = [UILabel]()
	var isScattered = false
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configLabels()
		configImgView()
		configLetterStack()
	}
	
	//MARK: - IBActions
	
	@IBAction func toggleButtonPressed(_ sender: Any) {
		toggleBtn.isEnabled = false
		
		UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [], animations: {
			if self.isScattered {
				self.reassemble()
			} else {
				self.fadeAndScatter()
			}
		}) { (_) in
			self.isScattered.toggle()
			self.toggleBtn.isEnabled = true
		}
	}
	
	//MARK: - Helpers
	private func configImgView() {
		logoImgView = UIImageView(image: UIImage(named: "lambda_logo"))
		logoImgView.translatesAutoresizingMaskIntoConstraints = false
		logoImgView.contentMode = .scaleAspectFit
		
		view.addSubview(logoImgView)
		
		NSLayoutConstraint.activate([
				logoImgView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
				logoImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
				logoImgView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
				logoImgView.heightAnchor.constraint(equalToConstant: 100)
			])
	}
	
	private func configLabels() {
		let subject = "Lambda".map{$0}
		
		for index in 0..<subject.count {
			let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
			var colorFloat: CGFloat {
				return CGFloat.random(in: 0...1)
			}
			
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = subject[index].description
			label.textColor = UIColor(displayP3Red: colorFloat, green: colorFloat, blue: colorFloat, alpha: 1)
			label.textAlignment = .center
			label.font = UIFont(name: label.font.fontName, size: 50)
			label.backgroundColor = .clear
			label.tag = index
			
			view.addSubview(label)
			letterLbls.append(label)
		}
	}
	
	private func configLetterStack() {
		letterStackView = UIStackView(arrangedSubviews: letterLbls)
		letterStackView.translatesAutoresizingMaskIntoConstraints = false
		letterStackView.distribution = .fillEqually
		
		view.addSubview(letterStackView)
		
		NSLayoutConstraint.activate([
			letterStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
			letterStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
			letterStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			letterStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
			])
	}
	
	private func fadeAndScatter() {
		UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
			self.logoImgView.alpha = 0
			
			for letterLbl in self.letterLbls {
				guard let outerFrame = self.letterStackView.superview?.frame else { return }
				
				let remainingX = (outerFrame.maxX) - self.letterStackView.frame.maxX
				let remainingY = (outerFrame.maxY) - self.letterStackView.frame.maxY
				
				let randomX = CGFloat.random(in: -(self.letterStackView.frame.minX)...remainingX)
				let randomY = CGFloat.random(in: -(self.letterStackView.frame.minY)...remainingY)
				
				letterLbl.transform = CGAffineTransform(translationX: randomX, y: randomY)
					.concatenating(CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: -1...4)))
				
				letterLbl.backgroundColor = #colorLiteral(red: 0.8409243226, green: 0.7375088334, blue: 1, alpha: 1)
			}
		})
		
		UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
			for letterLbl in self.letterLbls {
				letterLbl.backgroundColor?.withAlphaComponent(1)
			}
		}
	}
	
	private func reassemble() {
		UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
			self.logoImgView.alpha = 1
			
			for letterLbl in self.letterLbls {
				letterLbl.backgroundColor = .clear
				letterLbl.transform = .identity
			}
		})
	}
	
}

