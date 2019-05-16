//
//  ViewController.swift
//  scatter-and-gather
//
//  Created by Hector Steven on 5/15/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

struct LabelsCenter {
	let x: CGFloat
	let y: CGFloat
}

class ViewController: UIViewController {
	var shouldScramble = false
	var labels: [UILabel] = []
	var stackView = UIStackView()
	let colors: [UIColor] = [.gray, .green, .orange, .red , .purple, .blue, .black, .yellow]

	var labelsCenter: [LabelsCenter] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		createLabels()
		createImageView()
		
	}
	
	private func createColor() {
		
		
	}
	
	
	private func createImageView() {
		
		let imageview = UIImageView(image: #imageLiteral(resourceName: "Lambda_Logo"))
		imageview.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(imageview)
		NSLayoutConstraint.activate([
			
			imageview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
			imageview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
			imageview.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
			imageview.heightAnchor.constraint(equalToConstant: 100)
			
			])
		
	}
	
	private func createLabels() {
		let str = Array("LAMBDA")
		for char in str {
			let label = UILabel()
			label.translatesAutoresizingMaskIntoConstraints = false
			label.text = String(char)
			label.font = UIFont.boldSystemFont(ofSize: 60)
			
			view.addSubview(label)
			labels.append(label)
		}
		
		stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stackView)
		
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		stackView.spacing = 4
		labels.forEach( {
			stackView.addArrangedSubview( $0 )
		})
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			
			])
		
	}
	

	@IBAction func toggle(_ sender: UIBarButtonItem) {
		shouldScramble.toggle()
		print(shouldScramble)
		let labelscpy = labels

		
		for (i,label) in labelscpy.enumerated() {
			let x = CGFloat.random(in: 10...50)
			let y =  CGFloat.random(in: 50...500)
			
			
			
			if shouldScramble {
				labelsCenter.append(LabelsCenter(x: x, y: y))
			
				UIView.animate(withDuration: 2, animations: {
					
					label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
					label.center = CGPoint(x: label.center.x - x, y:  label.center.y + y)
						
					label.alpha = 0.1
						
					label.backgroundColor = self.colors.randomElement()!
					
				}, completion: nil)
				
			} else {
				UIView.animate(withDuration: 2, animations: {
							print(i)
							label.center = CGPoint(x:  label.center.x + self.labelsCenter[i].x, y: label.center.y - self.labelsCenter[i].y)
							label.alpha = 1
							label.transform = .identity
							label.backgroundColor = .white
					
				}) 
				
				
			}
		
	}
	
}

}
