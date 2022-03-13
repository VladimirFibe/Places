//
//  StorageManger.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManger {
  static func saveObject(_ place: Place) {
    try! realm.write {
      realm.add(place)
    }
  }
  
  static func deleteObject(_ place: Place) {
    try! realm.write {
      realm.delete(place)
    }
  }
}
