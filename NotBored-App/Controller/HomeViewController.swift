//
//  HomeViewController.swift
//  NotBored-App
//
//  Created by training on 09-06-22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var participantesTextField: UITextField!
    
    @IBOutlet weak var startButtonField: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp(){
        
        // Se establecen las propiedades del boton y de deja deshabilitado
        startButtonField.backgroundColor = .orange
        startButtonField.setTitleColor(.white, for: .normal)
        startButtonField.backgroundColor = .gray
        startButtonField.isEnabled = false
        let boolValue = UserDefaults.standard.bool(forKey: "checkTerm")
        print("boolValue: \(boolValue)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print (segue.identifier)
        switch segue.identifier {
        case "segueHomeToActivity":
            if let controllerActivity = segue.destination as? ActivityViewController {
                controllerActivity.participante = participantesTextField.text ?? "0"
            }
       
        default:
            print("segue no identificado")
        }
        
        UserDefaults.standard.set(true, forKey: "checkTerm")
    }
    
    @IBAction func participantesTextsChanged(_ sender: Any) {
        
        //Esta funcion se ejecuta cuando el textfield tenga cambios en su contenido
        print("ingrese validacion  de participantes")
        print(participantesTextField.text ?? "")
        
        let resultadoValidacion = validar(campo: participantesTextField.text ?? "")
        print(resultadoValidacion)
        
        if resultadoValidacion {
            startButtonField.isEnabled = true
            startButtonField.backgroundColor = .orange
        }
        else{
            startButtonField.backgroundColor = .gray
            startButtonField.isEnabled = false
            
            mensajeAlertaValidacion("Ingrese un número de partipantes válidos")
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
    
    func validarSiEsNumerico(campo:String) -> Bool {
        return Double(campo) != nil
    }
    
    func EsMenorAUno(x:Int) -> Bool{
        if x < 1{
            return true
        }
        else{
            return false
        }
    }
    
    func validar(campo:String) -> Bool{
        
        if self.validarSiEsNumerico(campo: campo){
            let valor = Int(campo) ?? 0
            if self.EsMenorAUno(x: valor){
                return false
            }
            else{
                return true
            }
        }
        return false
    }

}

