//
//  MatchModel.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import Foundation

class MatchModel {
    var signName: String
    var matchType: String
    
    init() {
        self.signName = ""
        self.matchType = ""
    }
    
    init(signName: String, matchType: String) {
        self.signName = signName
        self.matchType = matchType
    }
}
