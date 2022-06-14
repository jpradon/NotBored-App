//
//  RecommendationViewController.swift
//  NotBored-App
//
//  Created by training on 08-06-22.
//

import UIKit
import Alamofire

class RecommendationViewController: UIViewController {

    @IBOutlet weak var activityLabelField: UILabel!
    
    @IBOutlet weak var participantsLabelField: UILabel!
    
    @IBOutlet weak var priceLabelField: UILabel!
    
    @IBOutlet weak var typeLabelField: UILabel!

    @IBOutlet weak var typeImageField: UIImageView!
    
    var participante: String = ""
    var category: CategoryType = .random
    var random: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        
        self.title = category.rawValue
        getActivityCategoryAPI(random)

//        print("participante: \(participante)")
//        print("category: \(category)")
//        print("random: \(random)")
//        let paramsManager = ParamsManager.shared
//        let price = paramsManager.params.price ?? 0
//        print("participants: \(paramsManager.params.participants)")
//        print("price       : \(price)")
//        print("category    : \(paramsManager.params.category)")
//        print("random      : \(paramsManager.params.random)")
    }
    
    func getActivityCategoryAPI(_ random: Bool) {
        
        
        var urlAPI = "http://www.boredapi.com/api/activity"
        
        var primerElemento: Bool = false
        
        if !random {
            typeLabelField.alpha = 0.0
            typeImageField.alpha = 0.0
            urlAPI += "?type=\(category)"
            primerElemento=true
        } else {
            typeLabelField.alpha = 1.1
            typeImageField.alpha = 1.1
        }
        
        if (!participante.isEmpty) {
            
            if (primerElemento) {
                urlAPI += "&participants=\(participante)"
            } else {
                urlAPI += "?participants=\(participante)"
            }
        }
        
        print(urlAPI)
        AF.request(urlAPI).response { [self] response in
            print ("La respuesta del servicio es:")
            
            debugPrint(response)
            
            if response.error != nil {
                print("*** Error API: \(String(describing: response.error))")
                return
            }
            
            guard let data = response.data else {
                print("sin datos")
                return
            }
            
            do {
                let activity = try JSONDecoder().decode(Activity.self, from: data)
                print("*** resultado ***\n")
                activityLabelField.text = activity.activity
                typeLabelField.text = CategoryType.withLabel(activity.type)?.rawValue
                participantsLabelField.text = String(activity.participants)
                let price: Double = Double(activity.price)
                if price == 0.0 {
                    priceLabelField.text = PriceType.free.rawValue
                } else if price > 0.0 && price <= 0.3 {
                    priceLabelField.text = PriceType.low.rawValue
                } else if price > 3.0 && price <= 0.6 {
                    priceLabelField.text = PriceType.medium.rawValue
                } else {
                    priceLabelField.text = PriceType.high.rawValue
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func mensajeAlertaValidacion(_ mensaje: String) {
        // create the alert
        let alert = UIAlertController(title: "Validación", message: mensaje, preferredStyle: .alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onTapTryAnother(_ sender: Any) {
        getActivityCategoryAPI(random)
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
