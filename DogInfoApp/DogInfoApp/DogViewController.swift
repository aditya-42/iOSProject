//
//  DogViewController.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 10/12/24.
//

import UIKit

class DogViewController: UIViewController, NetworkingDelegate
    {
    
    var dog: Dogs?
    var imgURL: String?
    
    
    func networkDataReceived(dogInfo: [Dogs]) {
        
    }
    
    func networkingDidFinishWithImageObj(io: ImageModel) {
        
        imgURL = io.url!
        self.downloadImg(img:imgURL!)
    }
    
    func networkError() {
        
    }
    
    
    
    

    
    
    @IBOutlet weak var dogImage: UIImageView!
    
    
    @IBOutlet weak var dogName: UILabel!
    
    
    @IBOutlet weak var Dogtemperament: UILabel!
    
    @IBOutlet weak var dogLifeSpan: UILabel!
    
    @IBOutlet weak var dogOrigin: UILabel!
    
    @IBOutlet weak var dogBreedGroup: UILabel!
    
    @IBOutlet weak var dogBredFor: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        NetworkingManager.shared.delegate = self
        }
    
    
    @IBAction func saveToCoreData(_ sender: Any) {
        
        
        let imageData = dogImage.image?.jpegData(compressionQuality: 1.0) ?? Data()
        
        CoreDataManager.shared.addNewDog(
            name: dog?.name ?? "N/A",
            temperament: dog?.temperament ?? "N/A",
            breed_for: dog?.bred_for ?? "N/A",
            life_span: dog?.life_span ?? "N/A",
            breed_group: dog?.breed_group ?? "N/A",
            image: imageData
        )
        
        let alert = UIAlertController(title: "Success", message: "Dog details saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        dogName.text = dog?.name ?? "N/A"
        
        Dogtemperament.text! += dog?.temperament ?? "N/A"
                
        dogLifeSpan.text! += dog?.life_span ?? "N/A"
        
        dogBreedGroup.text! += dog?.breed_group ?? "N/A"
        
        dogBredFor.text! += dog?.bred_for ?? "N/A"
        
        NetworkingManager.shared.getDogImage(reference_id: self.dog?.reference_image_id ?? "")
    }
    
    func downloadImg(img:String){
               var url = URL(string: img)!
              
               var myQ = DispatchQueue(label: "myQ")
           myQ.async {
               do{
                   var imgData = try  Data(contentsOf: url)
                   
                   DispatchQueue.main.async {
                       self.dogImage.image = UIImage(data: imgData)
                       
                   }
                   
               }catch {
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
