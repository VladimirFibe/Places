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
  
  func configure(with place: Place) {
    if let data = place.data {
      placeImage.image  = UIImage(data: data)
    } else {
      placeImage.image = UIImage(named: "imagePlaceholder")
    }
    placeImage.layer.cornerRadius = placeImage.frame.size.height / 2
    placeImage.clipsToBounds = true
    nameLabel.text = place.name
    locationLabel.text = place.location
    typeLabel.text = place.type
  }
}
