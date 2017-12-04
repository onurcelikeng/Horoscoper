//
//  HoroscopeModel.swift
//  Horoscope.Widget
//
//  Created by Onur Celik on 3.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit

class HoroscopeModel: NSObject, NSCoding {
    var name: String
    var image: String
    var color: UIColor
    var horoscopeDescription: String
    
    override init() {
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
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.image = decoder.decodeObject(forKey: "image") as? String ?? ""
        self.color = decoder.decodeObject(forKey: "color") as? UIColor ?? UIColor.white
        self.horoscopeDescription = decoder.decodeObject(forKey: "horoscopeDescription") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(image, forKey: "image")
        coder.encode(color, forKey: "color")
        coder.encode(horoscopeDescription, forKey: "horoscopeDescription")
    }
}
