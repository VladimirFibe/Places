//
//  Place.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import Foundation
import UIKit

struct Place {
  var name: String
  var location: String
  var type: String
  var image: UIImage?
  
  static let restaurantNames = [
      "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
      "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
      "Speak Easy", "Morris Pub", "Вкусные истории",
      "Классик", "Love&Life", "Шок", "Бочка"
  ]
  static var places: [Place] {
    restaurantNames.map {
      Place(name: $0, location: "г. Алматы", type: "Столовая", image: UIImage(named: $0))
    }
  }
}
