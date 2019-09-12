//
//  Image.swift
//  ScatterAndGather
//
//  Created by Ciara Beitel on 9/10/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

struct Image {
    
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)!
    }
}
