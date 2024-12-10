//
//  CoreDogViewController.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 10/12/24.
//

import UIKit

class CoreDogViewController: UIViewController {
    
    var coreDogs: CoreDogs?
    
    @IBOutlet weak var dogName: UILabel!
    
    @IBOutlet weak var coreBreedGroup: UILabel!
    
    @IBOutlet weak var coreBredFor: UILabel!
    @IBOutlet weak var coreTemperament: UILabel!
    
    @IBOutlet weak var coreLifeSpan: UILabel!
    @IBOutlet weak var coreImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogName.text = coreDogs?.name ?? "N/A"
        
        coreTemperament.text! += coreDogs?.temperament ?? "N/A"
                
        coreLifeSpan.text! += coreDogs?.life_span ?? "N/A"
        
        coreBreedGroup.text! += coreDogs?.breed_group ?? "N/A"
        
        coreBredFor.text! += coreDogs?.bred_for ?? "N/A"
        
        if let imageData = coreDogs?.image, let image = UIImage(data: imageData) {
            coreImage.image = image
        } else {
    
            coreImage.image = UIImage(named: "defaultImage")
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
