//
//  NewPlaceTableViewController.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
  
  @IBOutlet weak var imagePlace: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Если лишние полосы, то
//    tableView.tableFooterView = UIView()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      let cameraIcon = UIImage(systemName: "camera")
      let photoIcon = UIImage(systemName: "photo")
      let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      let camera = UIAlertAction(title: "Camera", style: .default) { _ in
        self.chooseImagePicker(.camera)
      }
      camera.setValue(cameraIcon, forKey: "image")
      camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
      let photo = UIAlertAction(title: "Photo", style: .default) { _ in
        self.chooseImagePicker(.photoLibrary)
      }
      photo.setValue(photoIcon, forKey: "image")
      photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
      let cancel = UIAlertAction(title: "Cancel", style: .cancel)
      actionSheet.addAction(camera)
      actionSheet.addAction(photo)
      actionSheet.addAction(cancel)
      present(actionSheet, animated: true)
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

// MARK: - Work with image
extension NewPlaceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func chooseImagePicker(_ source: UIImagePickerController.SourceType) {
    if UIImagePickerController.isSourceTypeAvailable(source) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      imagePicker.sourceType = source
      present(imagePicker, animated: true)
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    imagePlace.image = info[.editedImage] as? UIImage
    imagePlace.contentMode = .scaleToFill
    imagePlace.clipsToBounds = true
    dismiss(animated: true)
  }
}
