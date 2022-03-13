//
//  PlaceTableViewController.swift
//  Places
//
//  Created by Vladimir Fibe on 11.03.2022.
//

import UIKit

class PlaceTableViewController: UITableViewController {
  var places = Place.places
  override func viewDidLoad() {
    super.viewDidLoad()
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
  
  // MARK: - Actions
  
  @IBAction func cancelAction(_ segue: UIStoryboardSegue) {
    if segue.identifier == "SaveSegue" {
      guard let placeVC = segue.source as? NewPlaceTableViewController else { return }
      placeVC.savePlace()
      if let place = placeVC.place {
        places.append(place)
      }
      tableView.reloadData()
    }
  }
}
