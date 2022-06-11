//
//  Global.swift
//  NotBored-App
//
//  Created by training on 10-06-22.
//

import Foundation

class Params {
    
    // MARK: Properties
    var participants: Int
    var price: Double?
    var category: CategoryType = .random
    var random: Bool = false

    // MARK: Inits
    init(participants: Int, price: Double?) {
        self.participants = participants
        self.price = price
    }
}
