//
//  ImageModel.swift
//  LambdaScatter
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

struct ImageLogo {
    
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)!
    }
}
