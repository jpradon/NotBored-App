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
        switch segue.identifier {
        case "segueHomeToRecommendationCategory":
            if let controllerRecomendation = segue.destination as? RecommendationViewController {
                controllerRecomendation.participante = "20"
                controllerRecomendation.random = false
                controllerRecomendation.category = .education
            }
        case "segueHomeToRecommendationRandom":
            if let controllerRecomendation = segue.destination as? RecommendationViewController {
                controllerRecomendation.participante = "20"
                controllerRecomendation.random = true
                controllerRecomendation.category = .random
               
            }
        default:
            print("segue no identificado")
        }
        
        UserDefaults.standard.set(true, forKey: "checkTerm")
        
        
            
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
