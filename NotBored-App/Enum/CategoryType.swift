//
//  CategoryType.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import Foundation

enum CategoryType: String, CaseIterable {
    
    case random = "Aleatorio",
         none = "Ninguno",
         education = "Educación",
         recreational = "Recreacional",
         social = "Social",
         diy = "Bricolaje",
         charity = "Caridad",
         cooking = "Cocina",
         relaxation = "Relajación",
         music = "Música",
         busywork = "Trabajo"
    
    static func withLabel(_ label: String) -> CategoryType? {
            return self.allCases.first{ "\($0)" == label }
        }
}
