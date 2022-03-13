//
//  PlaceTableViewCell.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

  @IBOutlet weak var placeImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  
  func configure(with title: String) {
    placeImage.image  = UIImage(named: title)
    placeImage.layer.cornerRadius = placeImage.frame.size.height / 2
    placeImage.clipsToBounds = true
    nameLabel.text = title
    locationLabel.text = "г. Алматы"
    typeLabel.text = "Restoran"
  }
}
