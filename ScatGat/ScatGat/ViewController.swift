//
//  ViewController.swift
//  ScatGat
//
//  Created by Jeffrey Santana on 8/14/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: - Properties
	
	var letterLbls = [UILabel]()
	var logoImgView: UIImageView!
	var isScattered = false
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configLabels()
		configImgView()
	}
	
	//MARK: - IBActions
	
	@IBAction func toggleButtonPressed(_ sender: Any) {
		UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
			if self.isScattered {
				self.reassemble()
			} else {
				self.fadeAndScatter()
			}
		}) { (_) in
			self.isScattered.toggle()
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
			label.tag = index
			
			view.addSubview(label)
			letterLbls.append(label)
		}
		
		let stackView = UIStackView(arrangedSubviews: letterLbls)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.distribution = .fillEqually
		
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
				stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
				stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
				stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
				stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
			])
	}
	
	private func fadeAndScatter() {
		UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
			self.logoImgView.alpha = 0
		})
	}
	
	private func reassemble() {
		UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
			self.logoImgView.alpha = 1
		})
	}
	
}

