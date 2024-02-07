//
//  DataDisplayViewController.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 19/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit
import SDWebImage
class DataDisplayViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private let cellReuseID: String = "displayCell"
    private var destinations: [Destination] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Moje destinacije"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadDestinationsFromUserDefaults()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let dataEntryVC = segue.destination as? DataEntryViewController {
            dataEntryVC.delegate = self
        }
    }
    
    /*func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.destinations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [deleteAction]
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = destinations[indexPath.row]
        let detailVC = DetailViewControler(destination: destination)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.destinations.remove(at: indexPath.row)
            // Create alert controller
            let alertController = UIAlertController(title: "Confirm Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
            
            // Add delete action
            let deleteConfirmAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                // Perform delete action
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            alertController.addAction(deleteConfirmAction)
            
            // Add cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            // Present alert controller
            self.present(alertController, animated: true, completion: nil)
        }
        return [deleteAction]
    }

}

// MARK: - Load/Store data to NSUserDefaults
extension DataDisplayViewController {
    private func loadDestinationsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Destination.userDefaultsKey) {
            let decoder = JSONDecoder()
            do {
                destinations = try decoder.decode([Destination].self, from: data)
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    private func saveDestinationsToUserDefaults() {
        let encoder = JSONEncoder()
        do {
            let data: Data = try encoder.encode(destinations)
            UserDefaults.standard.set(data, forKey: Destination.userDefaultsKey)
            UserDefaults.standard.synchronize()
        } catch {
            print(error)
        }
    }
}

// MARK: - DataEntryViewControllerDelegate
extension DataDisplayViewController: DataEntryViewControllerDelegate {
    func created(newDestination: Destination) {

        destinations.append(newDestination)
        tableView.reloadData()
        
        saveDestinationsToUserDefaults()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DataDisplayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
        let destination = destinations[indexPath.row]
        cell.textLabel?.text = destination.title
        cell.detailTextLabel?.text = destination.url
        cell.imageView?.sd_setImage(with: URL(string: destination.url), placeholderImage: UIImage(named: "TestImage.bmp"))
        return cell
    }
}

