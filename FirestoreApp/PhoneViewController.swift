//
//  PhoneViewController.swift
//  FirestoreApp
//
//  Created by Usuário Convidado on 17/11/17.
//  Copyright © 2017 FIAP. All rights reserved.
//

import UIKit
import Firebase

class PhoneViewController: UIViewController {

    @IBOutlet weak var tfModel: UITextField!
    @IBOutlet weak var tfManufactore: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    
    var phone: Phone!
    
    lazy var firestore: Firestore = {
        let store = Firestore.firestore()
        return store
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if phone != nil {
            tfYear.text = "\(phone.year)"
            tfManufactore.text = phone.manufactore
            tfModel.text = phone.model
            tfPrice.text = "\(phone.price)"
        }
        
       
    }

    @IBAction func save(_ sender: Any) {
        var phoneDict: [String: Any] = [:]
        phoneDict["model"] = tfModel.text!
        phoneDict["manufacture"] = tfManufactore.text!
        phoneDict["price"] = Double(tfPrice.text!)
        phoneDict["year"] = Int(tfYear.text!)
        
        if phone == nil {
            firestore.collection("phone").addDocument(data: phoneDict) { (error: Error?) in
                self.navigationController!.popViewController(animated: true)
            }
        } else {
            firestore.collection("phone").document(phone.id).setData(phoneDict, completion: { (error: Error?) in
                self.navigationController!.popViewController(animated: true)
            })
        }
        
    }


}
