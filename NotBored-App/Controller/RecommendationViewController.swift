//
//  RecommendationViewController.swift
//  NotBored-App
//
//  Created by training on 08-06-22.
//

import UIKit
import Alamofire

class RecommendationViewController: UIViewController {

    @IBOutlet weak var activityTextField: UITextField!
    
    @IBOutlet weak var typeTextField: UITextField!
    
    @IBOutlet weak var participantsTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var linkTextField: UITextField!
    
    @IBOutlet weak var keyTextField: UITextField!
    
    @IBOutlet weak var accessibilityTextField: UITextField!
    
    
    var participante: String = ""
    var category: CategoryType = .none
    var random: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        
    }
    
    func setup() {
        
        print("participante: \(participante)")
        print("category: \(category)")
        print("random: \(random)")
        
        getActivityCategoryAPI(random)

        let paramsManager = ParamsManager.shared
        let price = paramsManager.params.price ?? 0

        print("participants: \(paramsManager.params.participants)")
        print("price       : \(price)")
        print("category    : \(paramsManager.params.category)")
        print("random      : \(paramsManager.params.random)")
    }
    
    func getActivityCategoryAPI(_ random: Bool) {
        
        var urlAPI = "http://www.boredapi.com/api/activity"
        
        if !random {
            urlAPI += "?type=\(category)"
        }
        
        print(urlAPI)
        AF.request(urlAPI).response { [self] response in
            print ("La respuesta del servicio es:")
            
            debugPrint(response)
            
            if let error = response.error {
                print("*** Error API: \(response.error)")
                return
            }
            
            guard let data = response.data else {
                print("sin datos")
                return
            }
            
            do {
                let activity = try JSONDecoder().decode(Activity.self, from: data)
                print("*** resultado ***\n")
                activityTextField.text = activity.activity
                typeTextField.text = activity.type
                participantsTextField.text = String(activity.participants)
                priceTextField.text = String(activity.price)
                linkTextField.text = activity.link
                keyTextField.text = activity.key
                accessibilityTextField.text = String(activity.accessibility)
        
            } catch let error {
                print(error)
            }
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
