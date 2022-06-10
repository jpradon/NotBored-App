//
//  ActivityManager.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import Foundation

class ParamsManager: ParamsManagerProtocol {
   
    static let shared = ParamsManager(participants: 1, price: 0)
    
    // MARK: Properties
    var params: Params
    
    // MARK: Inits
    init(participants: Int, price: Double) {
        self.params = Params(participants: participants, price: price)
    }
    
}
