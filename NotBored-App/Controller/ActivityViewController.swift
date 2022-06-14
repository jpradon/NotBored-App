//
//  ActivityViewController.swift
//  NotBored-App
//
//  Created by training on 13-06-22.
//

import UIKit

class ActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var categorySelected: String = ""
    var participante: String = ""

    @IBOutlet weak var activityTableView: UITableView!
    
    var activityList = ["education", "recreational","social","diy","charity","cooking", "relaxation", "music", "busywork"]
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        activityTableView.dataSource = self
        activityTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityTableView.reloadData()
        print("DidAppear")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let plantillaCelda:BasicTableViewCell = activityTableView.dequeueReusableCell(withIdentifier: "rowActivityCell", for: indexPath) as! BasicTableViewCell
        
        
        let actvyList = activityList
        
        let actvyObject = actvyList[indexPath.row]
        
        plantillaCelda.activityLabel.text = actvyObject
        
        return plantillaCelda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categorySelected = activityList[indexPath.row]
       
        performSegue(withIdentifier: "segueActivitySelToRecommendationCategory",
                     sender: categorySelected)
        //tableView.deselectRow(at: indexPath, animated: true)
        print ("Categoria Seleccionada: \(categorySelected)")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       print (segue.identifier)
        print(participante)
        switch segue.identifier {
        case "segueActivityToRecommendationCategory":
            print("segueActivityToRecommendationCategory")
            if let controllerRecomendation = segue.destination as? RecommendationViewController {
                controllerRecomendation.participante = participante
                controllerRecomendation.random = false
                controllerRecomendation.category = .education
            }
        case "segueActivityToRecommendationRandom":
            print("segueActivityToRecommendationRandom")
            if let controllerRecomendation = segue.destination as? RecommendationViewController {
                controllerRecomendation.participante = participante
                controllerRecomendation.random = true
                controllerRecomendation.category = .random
               
            }
        case "segueActivitySelToRecommendationCategory":
                print("segueActivitySelToRecommendationCategory")
                if let controllerRecomendation = segue.destination as? RecommendationViewController, let categoria = sender as? String {
                    controllerRecomendation.participante = participante
                    controllerRecomendation.random = false
                    controllerRecomendation.category = CategoryType.withLabel(categoria) ?? .none
                   // controllerRecomendation.category = CategoryType.withLabel(categorySelected) ?? .none
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
