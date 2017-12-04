//
//  TodayViewController.swift
//  Horoscope.Widget
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        NSKeyedUnarchiver.setClass(WidgetModel.self, forClassName: "MySign")
        let userDefaults = UserDefaults(suiteName: "group.com.ersinyildiz.horoscoper")
        
        if let data = userDefaults?.object(forKey: "horoscopeWidget") as? Data {
            if let horoscope = NSKeyedUnarchiver.unarchiveObject(with: data) as? WidgetModel {
                print(horoscope.horoscopeDescription)
                dateTextLabel.text = horoscope.date
                nameTextLabel.text = horoscope.name
                iconImageView.image = UIImage(named: horoscope.image)
                descriptionTextView.text = horoscope.horoscopeDescription
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 300) : maxSize
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
