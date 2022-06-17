//
//  ActivityViewController.swift
//  NotBored-App
//
//  Created by training on 13-06-22.
//

import UIKit

struct Actividad {
    let nombre: String
    let imagen: String
}

var activityList = [
    Actividad(nombre: "education", imagen: "book"),
    Actividad(nombre: "recreational", imagen: "gamecontroller"),
    Actividad(nombre: "social", imagen: "person.3"),
    Actividad(nombre: "diy", imagen: "wrench"),
    Actividad(nombre: "charity", imagen: "dollarsign.square"),
    Actividad(nombre: "cooking", imagen: "fork.knife"),
    Actividad(nombre: "relaxation", imagen: "bed.double"),
    Actividad(nombre: "music", imagen: "headphones"),
    Actividad(nombre: "busywork", imagen: "macpro.gen1"),
]


class ActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var categorySelected: String = ""
    var participante: String = ""

    @IBOutlet weak var activityTableView: UITableView!

    
    override func viewDidLoad() {

        super.viewDidLoad()
        activityTableView.dataSource = self
        activityTableView.delegate = self
        activityTableView.backgroundColor = .clear
        activityTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .white

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //super.viewDidAppear(animated)
        activityTableView.reloadData()
        print("DidAppear")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let plantillaCelda:BasicTableViewCell = activityTableView.dequeueReusableCell(withIdentifier: "rowActivityCell", for: indexPath) as! BasicTableViewCell
        let plantillaCelda = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        //let actvyList = activityList
        
        let actvyObject = activityList[indexPath.row]
        
        
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = actvyObject.nombre
        listContentConfiguration.image = UIImage(systemName: actvyObject.imagen)
        //plantillaCelda.activityLabel.text = actvyObject
        
        plantillaCelda.contentConfiguration = listContentConfiguration
        plantillaCelda.backgroundColor = .clear
        plantillaCelda.tintColor = .white
        plantillaCelda.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return plantillaCelda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categorySelected = activityList[indexPath.row].nombre
       
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
                controllerRecomendation.category = CategoryType.withLabel(categorySelected) ?? .none
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
