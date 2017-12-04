//
//  HoroscopeDetailViewController.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class HoroscopeDetailViewController: UIViewController {
    @IBOutlet weak var horoscopeTitle: UINavigationItem!
    @IBOutlet weak var horoscopeImage: UIImageView!
    @IBOutlet weak var horoscopeName: UILabel!
    @IBOutlet weak var horoscopeDescription: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var loveTextField: UITextView!
    @IBOutlet weak var careerTextField: UITextView!
    @IBOutlet weak var moneyTextField: UITextView!
    @IBOutlet weak var healthTextField: UITextView!
    @IBOutlet weak var firstMatchLabel: UILabel!
    @IBOutlet weak var firstMatchName: UILabel!
    @IBOutlet weak var firstMatchIcon: UIImageView!
    @IBOutlet weak var secondMatchLabel: UILabel!
    @IBOutlet weak var secondMatchName: UILabel!
    @IBOutlet weak var secondMatchIcon: UIImageView!
    @IBOutlet weak var thirdMatchLabel: UILabel!
    @IBOutlet weak var thirdMatchName: UILabel!
    @IBOutlet weak var thirdMatchIcon: UIImageView!
    @IBOutlet weak var signButton: UIButton!
    
    var segmentedControl = BetterSegmentedControl()
    static var horoscope = HoroscopeModel()
    var alertController = UIAlertController()
    var day: String = "today"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.progressConfigure()
        self.SegmentControl()
        self.loadDescription()
        self.loadLove()
        self.loadCareer()
        self.loadMoney()
        self.loadHealth()
        self.loadMatches()
    }

    private func configure() {

        horoscopeTitle.title = HoroscopeDetailViewController.horoscope.name
        horoscopeName.text = HoroscopeDetailViewController.horoscope.name
        horoscopeDescription.text = HoroscopeDetailViewController.horoscope.horoscopeDescription
        horoscopeImage.image = UIImage(named: HoroscopeDetailViewController.horoscope.image)
        signButton.layer.cornerRadius = 10
    }
    
    private func progressConfigure() {
        alertController = UIAlertController(title: nil, message: "Loading...\n\n", preferredStyle: .alert)
        let spinnerIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
        spinnerIndicator.color = UIColor.black
        spinnerIndicator.startAnimating()
        alertController.view.addSubview(spinnerIndicator)
    }
    
    private func loadDescription() {
        self.present(alertController, animated: false, completion: nil)

        DispatchQueue.global(qos: .userInitiated).async{
            var descriptionText = ""
            let sign = findHoroscopeSign(sign: HoroscopeDetailViewController.horoscope.name)
            
            HoroscopeService.getSunSign(sign: sign, time: String(describing: self.day)) {(description) -> Void in
                descriptionText = description
            }
            
            DispatchQueue.main.async {
                self.descriptionTextField.text = descriptionText
            }
        }
    }
    
    private func loadLove() {
        DispatchQueue.global(qos: .userInitiated).async{
            var loveText = ""
            let sign = findHoroscopeSign(sign: HoroscopeDetailViewController.horoscope.name)
            
            HoroscopeService.getLove(sign: sign, time: String(describing: self.day)) {(love) -> Void in
                loveText = love
            }
            
            DispatchQueue.main.async {
                self.loveTextField.text = loveText
            }
        }
    }
    
    private func loadCareer() {
        DispatchQueue.global(qos: .userInitiated).async{
            var careerText = ""
            let sign = findHoroscopeSign(sign: HoroscopeDetailViewController.horoscope.name)
            
            HoroscopeService.getCareer(sign: sign, time: String(describing: self.day)) {(career) -> Void in
                careerText = career
            }
            
            DispatchQueue.main.async {
                self.careerTextField.text = careerText
            }
        }
    }
    
    private func loadMoney() {
        DispatchQueue.global(qos: .userInitiated).async{
            var moneyText = ""
            let sign = findHoroscopeSign(sign: HoroscopeDetailViewController.horoscope.name)
            
            HoroscopeService.getMoney(sign: sign, time: String(describing: self.day)) {(money) -> Void in
                moneyText = money
            }
            
            DispatchQueue.main.async {
                self.moneyTextField.text = moneyText
            }
        }
    }
    
    private func loadHealth() {
        DispatchQueue.global(qos: .userInitiated).async{
            var healthText = ""
            let sign = findHoroscopeSign(sign: HoroscopeDetailViewController.horoscope.name)
            
            HoroscopeService.getHealth(sign: sign, time: String(describing: self.day)) {(health) -> Void in
                healthText = health
            }
            
            DispatchQueue.main.async {
                self.healthTextField.text = healthText
            }
        }
    }
    
    private func loadMatches() {
        DispatchQueue.global(qos: .userInitiated).async{
            var firstMatchType = ""
            var firstMatchName = ""
            var secondMatchType = ""
            var secondMatchName = ""
            var thirdMatchType = ""
            var thirdMatchName = ""
            let sign = findHoroscopeSign(sign: HoroscopeDetailViewController.horoscope.name)
            
            HoroscopeService.getMatches(sign: sign, time: String(describing: self.day)) {(matches) -> Void in
                firstMatchType = matches[0].matchType
                firstMatchName = matches[0].signName
                secondMatchType = matches[1].matchType
                secondMatchName = matches[1].signName
                thirdMatchType = matches[2].matchType
                thirdMatchName = matches[2].signName
            }
            
            DispatchQueue.main.async {
                self.firstMatchLabel.text = firstMatchType
                self.firstMatchName.text = firstMatchName
                self.secondMatchLabel.text = secondMatchType
                self.secondMatchName.text = secondMatchName
                self.thirdMatchLabel.text = thirdMatchType
                self.thirdMatchName.text = thirdMatchName
                self.firstMatchIcon.image = UIImage(named: firstMatchName.lowercased())
                self.secondMatchIcon.image = UIImage(named: secondMatchName.lowercased())
                self.thirdMatchIcon.image = UIImage(named: thirdMatchName.lowercased())
                self.alertController.dismiss(animated: true, completion: nil);
            }
        }
    }
    
    private func SegmentControl(){
        let control = BetterSegmentedControl(
            frame: CGRect(x: 0.0, y: 60.0, width: view.bounds.width, height: 40.0),
            titles: ["Yesterday", "Today", "Tomorrow",],
            index: 1,
            options: [.backgroundColor(UIColor(red: 43/255, green: 22/255, blue: 58/255, alpha: 1)),
                      .titleColor(.white),
                      .indicatorViewBackgroundColor(UIColor(red: 77/255, green: 46/255, blue: 98/255, alpha: 1)),
                      .selectedTitleColor(.white),
                      .titleFont(UIFont(name: "HelveticaNeue", size: 14.0)!),
                      .selectedTitleFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!)]
        )
        control.addTarget(self, action: #selector(HoroscopeDetailViewController.navigationSegmentedControlValueChanged(_:)), for: .valueChanged)
        view.addSubview(control)
    }
    
    @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl){
        if sender.index == 0 {
            self.day = String(describing: Day.yesterday)
        } else if sender.index == 1 {
            self.day = String(describing: Day.today)
        } else if sender.index == 2 {
            self.day = String(describing: Day.tomorrow)
        }
        
        self.progressConfigure()
        self.loadDescription()
        self.loadLove()
        self.loadCareer()
        self.loadMoney()
        self.loadHealth()
        self.loadMatches()
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getScreenshot(viewToSnapShot:UIView) -> UIImage {
        UIGraphicsBeginImageContext(viewToSnapShot.frame.size)
        viewToSnapShot.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    @IBAction func shareButtonClick(_ sender: Any) {
        let imageToBePosted = getScreenshot(viewToSnapShot: self.view)
        let sharedDescription = self.descriptionTextField.text
        let activityViewController = UIActivityViewController(activityItems: [imageToBePosted as UIImage, sharedDescription! as NSString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }

    @IBAction func setMySignButtonClick(_ sender: Any) {
        NSKeyedArchiver.setClassName("MySign", for: WidgetModel.self)
        let model: WidgetModel = WidgetModel(name: HoroscopeDetailViewController.horoscope.name, image: HoroscopeDetailViewController.horoscope.image, horoscopeDescription: self.descriptionTextField.text, date: HoroscopeDetailViewController.horoscope.horoscopeDescription)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: model)
        let userDefaults = UserDefaults(suiteName: "group.com.ersinyildiz.horoscoper")
        userDefaults?.removeObject(forKey: "horoscopeWidget")
        userDefaults!.set(data, forKey: "horoscopeWidget")
        userDefaults!.synchronize()
        
        let alert = UIAlertController(title: "Your horoscope is assigned successfully.", message: "You can change your horoscope again if you want.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
