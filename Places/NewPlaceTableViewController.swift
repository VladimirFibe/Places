//
//  NewPlaceTableViewController.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Если лишние полосы, то
//    tableView.tableFooterView = UIView()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      // select image
      print("image")
    } else {
      view.endEditing(true)
    }
  }
}

// MARK: - TextFieldDelegate

extension NewPlaceTableViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
