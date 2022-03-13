//
//  Place.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import RealmSwift
import UIKit

class Place: Object {
  @objc dynamic var name = ""
  @objc dynamic var location: String?
  @objc dynamic var type: String?
  @objc dynamic var data: Data?

  convenience init(name: String, location: String?, type: String?, data: Data?) {
    self.init()
    self.name = name
    self.location = location
    self.type = type
    self.data = data
  }
}
