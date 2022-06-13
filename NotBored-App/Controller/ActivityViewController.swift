//
//  ActivityViewController.swift
//  NotBored-App
//
//  Created by training on 13-06-22.
//

import UIKit

class ActivityViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      //  print (segue.identifier)
        switch segue.identifier {
        case "segueActivityToRecommendationCategory":
            print("segueActivityToRecommendationCategory")
            if let controllerRecomendation = segue.destination as? RecommendationViewController {
                controllerRecomendation.participante = "20"
                controllerRecomendation.random = false
                controllerRecomendation.category = .education
            }
        case "segueActivityToRecommendationRandom":
            print("segueActivityToRecommendationRandom")
            if let controllerRecomendation = segue.destination as? RecommendationViewController {
                controllerRecomendation.participante = "20"
                controllerRecomendation.random = true
                controllerRecomendation.category = .random
               
            }
        default:
            print("segue no identificado")
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
