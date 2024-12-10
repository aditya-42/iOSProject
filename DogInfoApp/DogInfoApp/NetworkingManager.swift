//
//  NetworkingManager.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 09/12/24.
//

import Foundation


protocol NetworkingDelegate{
    func networkDataReceived(dogInfo: [Dogs])
    func networkError()
    func networkingDidFinishWithImageObj(io: ImageModel)
}


class NetworkingManager{
    
    
    var delegate : NetworkingDelegate?
    static var shared = NetworkingManager()
    
    
    func getDataFromURL(){
        var urlString = URL(string: "https://api.thedogapi.com/v1/breeds?api_key=live_BbJXw0qbUaSLqqBS3qmgKdcc9TRO9b4AfCw4EF6KbM8lIbFWJSLuyanpuQtW1Bej")
        
        
        var dataTask = URLSession.shared.dataTask(with: urlString!){data,response,error in
            
            if let error = error{
                        print("Error: \(error)")
                self.delegate?.networkError()
                        return
                    }
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)
            else{
                self.delegate?.networkError()
                return
            }
            
            
            if let goodData = data{
                var decoder = JSONDecoder()
                
                do {
                    let dogInfoFromAPI = try decoder.decode([Dogs].self, from: goodData)
                    self.delegate?.networkDataReceived(dogInfo: dogInfoFromAPI)
                }catch{
                    print(error)
                }
                
                
            }
            
            
            
            
            
    }
    
        
        dataTask.resume()

        
        
    }
    
    
    
    
    func getDogImage(reference_id: String) {

    
        guard let url = URL(string: "https://api.thedogapi.com/v1/images/\(reference_id)?api_key=live_BbJXw0qbUaSLqqBS3qmgKdcc9TRO9b4AfCw4EF6KbM8lIbFWJSLuyanpuQtW1Bej") else {
            print("Invalid URL")
            delegate?.networkError()
            return
        }
    
        let datatask = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {// handle, then...return}
                                   print(error)
                    self.delegate?.networkError()
                                   return
                           }
                guard let httpResponse =
                                   response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)
                           else {
    
                               // no good response
                    self.delegate?.networkError()
                               return
                           }
    
                if let goodData = data {
    
                    let decoder = JSONDecoder()
                    do {
                        let imageObject = try decoder.decode(ImageModel.self, from: goodData)
                        self.delegate?.networkingDidFinishWithImageObj(io: imageObject)
    
                    }catch {
                        print(error)
    
                    }
                }
            }
        datatask.resume()
    
        }

        
    }
    
    
    
    
    
    
