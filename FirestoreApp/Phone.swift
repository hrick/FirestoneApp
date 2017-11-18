//
//  Phone.swift
//  FirestoreApp
//
//  Created by Usuário Convidado on 17/11/17.
//  Copyright © 2017 FIAP. All rights reserved.
//

import Foundation

class Phone {
    var id: String
    var model: String
    var manufactore: String
    var price: Double
    var year: Int
    
    init(id: String, model: String, manufactore: String, price: Double, year: Int) {
        self.id = id
        self.model = model
        self.manufactore = manufactore
        self.price = price
        self.year = year
    }
}
