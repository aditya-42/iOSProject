//
//  ImageModel.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 10/12/24.
//

import Foundation


class ImageModel:Decodable{
    let url:String?
    
    init(url: String) {
        self.url = url
    }
}
