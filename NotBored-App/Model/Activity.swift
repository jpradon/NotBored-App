//
//  Activity.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import Foundation

class Activity {
    
    // MARK: Properties
    var participants: Int
    var price: Double?
    var category: CategoryType = .none
    var random: Bool = false

    // MARK: Inits
    init(participants: Int, price: Double?) {
        self.participants = participants
        self.price = price
    }
    
}
