//
//  HoroscopeService.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import Foundation
import SwiftSoup

class HoroscopeService: NSObject {
    let baseUrl: String = "https://www.horoscope.com/us/horoscopes/"

    
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
    
    public static func getLove(sign: String, time: String, completionHandler: @escaping (String) -> Void) {
        do {
            let url = NSURL(string: "https://www.horoscope.com/us/horoscopes/love/horoscope-love-daily-" + time + ".aspx?sign=" + sign)
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Element = try document.select("div.horoscope-content p").first() {
                let love = try data.text()
                completionHandler(love)
            }
        } catch {
            
        }
    }
    
    public static func getCareer(sign: String, time: String, completionHandler: @escaping (String) -> Void) {
        do {
            let url = NSURL(string: "https://www.horoscope.com/us/horoscopes/career/horoscope-career-daily-" + time + ".aspx?sign=" + sign)
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Element = try document.select("div.horoscope-content p").first() {
                let career = try data.text()
                completionHandler(career)
            }
        } catch {
            
        }
    }
    
    public static func getMoney(sign: String, time: String, completionHandler: @escaping (String) -> Void) {
        do {
            let url = NSURL(string: "https://www.horoscope.com/us/horoscopes/money/horoscope-money-weekly.aspx?sign=" + sign)
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Element = try document.select("div.horoscope-content p").first() {
                let career = try data.text()
                completionHandler(career)
            }
        } catch {
            
        }
    }
    
    public static func getHealth(sign: String, time: String, completionHandler: @escaping (String) -> Void) {
        do {
            let url = NSURL(string: "https://www.horoscope.com/us/horoscopes/wellness/horoscope-wellness-daily-" + time + ".aspx?sign=" + sign)
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Element = try document.select("div.horoscope-content p").first() {
                let career = try data.text()
                completionHandler(career)
            }
        } catch {
            
        }
    }
    
    public static func getMatches(sign: String, time: String, completionHandler: @escaping ([MatchModel]) -> Void) {
        do {
            var matches: [MatchModel] = []
            let url = NSURL(string: "https://www.horoscope.com/us/horoscopes/general/horoscope-general-daily-" + time + ".aspx?sign=" + sign)
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            if let data: Elements = try document.select("div.matches div.col div.row") {
                for element in data {
                    let textNodes = try element.getAllElements()
                    for textNode in textNodes {
                        let name = try textNode.select("div.col a h4").text()
                        let type = try textNode.select("div.col a h5").text()
                        if name != "",  type != "" {
                            let model = MatchModel(signName: name, matchType: type)
                            matches.append(model)
                        }
                    }
                }
                matches.remove(at: 0)
                completionHandler(matches)
            }
        } catch {
            
        }
    }
    
}
