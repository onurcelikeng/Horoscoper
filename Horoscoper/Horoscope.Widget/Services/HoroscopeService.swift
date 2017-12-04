//
//  HoroscopeService.swift
//  Horoscope.Widget
//
//  Created by Onur Celik on 3.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import Foundation
import SwiftSoup

class HoroscopeService: NSObject {
    let asd: String = "https://www.horoscope.com/us/horoscopes/"
    
    
    public static func getSunSign(sign: String, time: String, completionHandler: @escaping (String) -> Void)  {
        do {
            let url = NSURL(string: "https://www.horoscope.com/us/horoscopes/general/horoscope-general-daily-" + time + ".aspx?sign=" + sign)
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Element = try document.select("div.horoscope-content p").first() {
                let description = try data.text()
                completionHandler(description)
            }
        } catch {
            
        }
    }
}
