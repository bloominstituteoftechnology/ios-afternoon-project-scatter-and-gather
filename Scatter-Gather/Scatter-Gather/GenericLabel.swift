//
//  GenericLabel.swift
//  Scatter-Gather
//
//  Created by Marlon Raskin on 8/14/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class GenericLabel: UILabel {
	init(text: String, textAlignment: NSTextAlignment = .center, font: UIFont = UIFont.boldSystemFont(ofSize: 25)) {
		super.init(frame: .zero)
		self.text = text
		self.translatesAutoresizingMaskIntoConstraints = false
		self.textAlignment = textAlignment
		self.font = font
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
