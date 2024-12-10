//
//  SearchTableViewController.swift
//  DogInfoApp
//
//  Created by Aditya Purohit on 10/12/24.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, NetworkingDelegate {
    func networkingDidFinishWithImageObj(io: ImageModel) {
        
        
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var apiDogs : [Dogs] = []
    var dogsList : [Dogs] = []

    
    
    override func viewWillAppear(_ animated: Bool) {
        NetworkingManager.shared.delegate = self
        if searchBar.text?.isEmpty ?? true {
                    dogsList = apiDogs
                }
        tableView.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.shared.delegate = self
        NetworkingManager.shared.getDataFromURL()
        
        NetworkingManager.shared.getDogImage(reference_id: "rkiByec47")
        

        searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dogsList = apiDogs
        } else {
            dogsList = apiDogs.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            

        }
        tableView.reloadData()
    }

    
    
    
    func searchDogSpecies(dogSpeciesName: String) -> [Dogs] {
        let filteredDogs = filterDogs(dogs: apiDogs, keyword: dogSpeciesName)
        return filteredDogs
    }

    func filterDogs(dogs: [Dogs], keyword: String) -> [Dogs] {
        return dogs.filter { $0.name.lowercased().contains(keyword.lowercased()) }
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dogsList.count
    }
    
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dogsList[indexPath.row].name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
  
    
    func networkDataReceived(dogInfo: [Dogs]) {
        
        DispatchQueue.main.async {
            self.apiDogs = dogInfo
            self.dogsList = dogInfo
            self.tableView.reloadData()
        }
    }
    
    func networkError() {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
        var dogVC = segue.destination as! DogViewController
        var i = tableView.indexPathForSelectedRow?.row
        dogVC.dog = dogsList[i!]
           
    }

}
