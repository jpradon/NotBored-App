//
//  ActivityManager.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import Foundation

class ActivityManager: ActivityManagerProtocol {
   
    static let shared = ActivityManager(participants: 1, price: 0)
    
    // MARK: Properties
    var activity: Activity
    
    // MARK: Inits
    init(participants: Int, price: Double) {
        self.activity = Activity(participants: participants, price: price)
    }
    
}
