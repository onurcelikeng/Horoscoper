//
//  DataProvider.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit

class DataProvider: NSObject {

    static func loadData() -> [HoroscopeModel] {
        var horoscopes: [HoroscopeModel] = []
        
        horoscopes.append(HoroscopeModel(name: "Aries", image: "aries", color: UIColor.init(red: 53/255, green: 27/255, blue: 73/255, alpha: 1), horoscopeDescription: "Mar 21 - Apr 19"))
        horoscopes.append(HoroscopeModel(name: "Taurus", image: "taurus", color: UIColor.init(red: 60/255, green: 34/255, blue: 80/255, alpha: 1), horoscopeDescription: "Apr 20 - May 20"))
        horoscopes.append(HoroscopeModel(name: "Gemini", image: "gemini", color: UIColor.init(red: 68/255, green: 42/255, blue: 86/255, alpha: 1), horoscopeDescription: "May 21 - Jun 20"))
        horoscopes.append(HoroscopeModel(name: "Cancer", image: "cancer", color: UIColor.init(red: 108/255, green: 53/255, blue: 104/255, alpha: 1), horoscopeDescription: "Jun 21 - Jul 22"))
        horoscopes.append(HoroscopeModel(name: "Leo", image: "leo", color: UIColor.init(red: 95/255, green: 58/255, blue: 111/255, alpha: 1), horoscopeDescription: "Jul 23 - Aug 22"))
        horoscopes.append(HoroscopeModel(name: "Virgo", image: "virgo", color: UIColor.init(red: 98/255, green: 66/255, blue: 124/255, alpha: 1), horoscopeDescription: "Aug 23 - Sep 22"))
        horoscopes.append(HoroscopeModel(name: "Libra", image: "libra", color: UIColor.init(red: 126/255, green: 61/255, blue: 118/255, alpha: 1), horoscopeDescription: "Sep 23 - Oct 22"))
        horoscopes.append(HoroscopeModel(name: "Scorpio", image: "scorpio", color: UIColor.init(red: 133/255, green: 58/255, blue: 108/255, alpha: 1), horoscopeDescription: "Oct 23 - Nov 21"))
        horoscopes.append(HoroscopeModel(name: "Sagittarius", image: "sagittarius", color: UIColor.init(red: 145/255, green: 64/255, blue: 116/255, alpha: 1), horoscopeDescription: "Nov 22 - Dec 21"))
        horoscopes.append(HoroscopeModel(name: "Capricorn", image: "capricorn", color: UIColor.init(red: 198/255, green: 91/255, blue: 116/255, alpha: 1), horoscopeDescription: "Dec 22 - Jan 19"))
        horoscopes.append(HoroscopeModel(name: "Aquarius", image: "aquarius", color: UIColor.init(red: 190/255, green: 78/255, blue: 109/255, alpha: 1), horoscopeDescription: "Jan 20 - Feb 18"))
        horoscopes.append(HoroscopeModel(name: "Pisces", image: "pisces", color: UIColor.init(red: 163/255, green: 78/255, blue: 118/255, alpha: 1), horoscopeDescription: "Feb 19 - Mar 20"))
        
        return horoscopes
    }
}
