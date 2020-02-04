//
//  Image.swift
//  Scatter and Gather
//
//  Created by Kevin Stewart on 2/2/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation
import UIKit

struct Image {
    var imageName: String
//    var image: UIImage
    
    init(name: String) {
        self.imageName = name
//        self.image = UIImage(named: name)!
    }
    
        var image: UIImage {
            return UIImage(named: imageName)!
        }
}
