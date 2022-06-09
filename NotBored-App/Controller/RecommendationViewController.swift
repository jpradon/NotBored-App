//
//  RecommendationViewController.swift
//  NotBored-App
//
//  Created by training on 08-06-22.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    var participante: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        
    }
    
    func setup() {
        
        print("participante: \(participante)")
        let activityManager = ActivityManager.shared
        
        // seleccione una categoria
        activityManager.activity.category = .cooking
        activityManager.activity.random = false
        
        // seleccione random
        //activityManager.activity.category = .none
        //activityManager.activity.random = true
        
        
        let price = activityManager.activity.price ?? 0
        
        print("participants: \(activityManager.activity.participants)")
        print("price       : \(price)")
        print("category    : \(activityManager.activity.category)")
        print("random      : \(activityManager.activity.random)")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
