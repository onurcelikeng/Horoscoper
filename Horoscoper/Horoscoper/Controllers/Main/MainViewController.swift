//
//  MainViewController.swift
//  Horoscoper
//
//  Created by Onur Celik on 2.12.2017.
//  Copyright © 2017 Onur Celik. All rights reserved.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var horoscopes: [HoroscopeModel] = []
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createNotification()
        horoscopes = DataProvider.loadData()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horoscopes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.displayContent(model: horoscopes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HoroscopeDetailViewController.horoscope = horoscopes[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "horoscopeDetailViewController") as! UINavigationController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = self.view.frame.size.height
        let width: CGFloat  = self.view.frame.size.width
        return CGSize(width: width * 0.333, height: height * 0.23)
    }
    
    func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Your feature is waiting.."
        content.body = "Have a look kat your star sign!"
        content.badge = 1
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
