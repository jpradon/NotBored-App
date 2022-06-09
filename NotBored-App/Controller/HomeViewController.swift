//
//  HomeViewController.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let boolValue = UserDefaults.standard.bool(forKey: "checkTerm")
        print("boolValue: \(boolValue)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueHometoRecommendation" {
            if let controller = segue.destination as? RecommendationViewController {
                controller.participante = "20"
            }
            
            UserDefaults.standard.set(true, forKey: "checkTerm")
            
        }
        
        
            
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
