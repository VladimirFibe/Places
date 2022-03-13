//
//  PlaceTableViewController.swift
//  Places
//
//  Created by Vladimir Fibe on 11.03.2022.
//

import UIKit

class PlaceTableViewController: UITableViewController {
  let restaurantNames = [
      "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
      "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
      "Speak Easy", "Morris Pub", "Вкусные истории",
      "Классик", "Love&Life", "Шок", "Бочка"
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurantNames.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlaceTableViewCell
    let title = restaurantNames[indexPath.row]
    cell.configure(with: title)
    return cell
  }
}
