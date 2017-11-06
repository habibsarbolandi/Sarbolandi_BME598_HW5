//
//  Reminder.swift
//  Sarbolandi_HW5
//
//  Created by Habib Sarbolandi on 11/5/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//

import Foundation
import UIKit

class Reminder: NSObject, NSCoding {
    var notification: UILocalNotification
    var title: String
    var time: NSDate
    
    init(title: String, time: NSDate, notfication: UILocalNotification) {
        self.title = title
        self.time = time
        self.notification = notfication
        
        super.init()
    }
    
    struct PropertyKey {
        static let titleKey = "title"
        static let timeKey = "time"
        static let notificationKey = "notification"
    }
    
    deinit {
        UIApplication.shared.cancelLocalNotification(self.notification)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.titleKey)
        aCoder.encode(time, forKey: PropertyKey.timeKey)
        aCoder.encode(notification, forKey: PropertyKey.notificationKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: PropertyKey.titleKey) as! String
        let time = aDecoder.decodeObject(forKey: PropertyKey.timeKey) as! NSDate
        let notification = aDecoder.decodeObject(forKey: PropertyKey.notificationKey) as! UILocalNotification
        
        self.init(title: title, time: time, notfication: notification)
    }
}
