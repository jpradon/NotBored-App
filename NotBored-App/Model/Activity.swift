//
//  Activity.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import Foundation

class Activity: Decodable {
    
//    {
//        "activity": "Write a short story",
//        "type": "recreational",
//        "participants": 1,
//        "price": 0,
//        "link": "",
//        "key": "6301585",
//        "accessibility": 0.1
//    }
    
    var activity: String
    var type: String
    var participants: Int
    var price: Double
    var link: String
    var key: String
    var accessibility: Double

    init( activity: String, type: String, participants: Int, price: Double, link: String, key: String, accessibility: Double) {
        
        self.activity = activity
        self.type = type
        self.participants = participants
        self.link = link
        self.price = price
        self.key = key
        self.accessibility = accessibility
        
    }
    
}
