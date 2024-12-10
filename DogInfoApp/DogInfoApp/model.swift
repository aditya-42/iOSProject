//
//  model.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 10/12/24.
//

import Foundation

class Dogs:Decodable{
    let name: String
    let life_span: String
    let temperament: String?
    let origin: String?
    let reference_image_id: String?
    let bred_for: String?
    let breed_group: String?
    
    init(name: String, life_span: String, temperament: String?, origin: String?, reference_image_id: String?, bred_for: String?, breed_group: String?) {
        self.name = name
        self.life_span = life_span
        self.temperament = temperament
        self.origin = origin
        self.reference_image_id = reference_image_id
        self.bred_for = bred_for
        self.breed_group = breed_group
    }
}
