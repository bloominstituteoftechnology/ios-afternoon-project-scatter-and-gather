//
//  ImageModel.swift
//  LambdaScatter
//
//  Created by admin on 10/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

struct ImageModel {
    
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)!
    }
}
