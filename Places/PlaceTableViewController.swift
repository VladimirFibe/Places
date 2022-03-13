//
//  PlaceTableViewController.swift
//  Places
//
//  Created by Vladimir Fibe on 11.03.2022.
//

import UIKit
import RealmSwift

class PlaceTableViewController: UITableViewController {
  var places: Results<Place>!
  override func viewDidLoad() {
    super.viewDidLoad()
    places = realm.objects(Place.self)
  }
  
  // MARK: - Actions
  
  @IBAction func cancelAction(_ segue: UIStoryboardSegue) {
    if segue.identifier == "SaveSegue" {
      guard let placeVC = segue.source as? NewPlaceTableViewController else { return }
      placeVC.savePlace()
      tableView.reloadData()
    }
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return places.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlaceTableViewCell
    let place = places[indexPath.row]
    cell.configure(with: place)
    return cell
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let place = places[indexPath.row]
    let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
      StorageManger.deleteObject(place)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    return UISwipeActionsConfiguration(actions: [action])
  }
}
