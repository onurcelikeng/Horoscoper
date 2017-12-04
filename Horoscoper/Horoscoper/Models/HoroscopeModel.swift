//
//  HoroscopeModel.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit

class HoroscopeModel {
    var name: String
    var image: String
    var color: UIColor
    var horoscopeDescription: String
    
    init() {
        self.name = ""
        self.image = ""
        self.color = UIColor.white
        self.horoscopeDescription = ""
    }
    
    init(name: String, image: String, color: UIColor, horoscopeDescription: String) {
        self.name = name
        self.image = image
        self.color = color
        self.horoscopeDescription = horoscopeDescription
    }
}
