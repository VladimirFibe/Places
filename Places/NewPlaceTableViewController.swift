//
//  NewPlaceTableViewController.swift
//  Places
//
//  Created by Vladimir Fibe on 13.03.2022.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
  var imageIsChanged = false
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var placeImage: UIImageView!
  @IBOutlet weak var placeName: UITextField!
  @IBOutlet weak var placeLocation: UITextField!
  @IBOutlet weak var placeType: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    saveButton.isEnabled = false
    placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    // Если лишние полосы, то
//    tableView.tableFooterView = UIView()
  }
  
  func savePlace() {
    let name = placeName.text ?? "New"
    let location = placeLocation.text ?? ""
    let type = placeType.text ?? ""
    let image = imageIsChanged ? placeImage.image : UIImage(named: "imagePlaceholder")
    let data = image?.pngData()
    let place = Place(name: name,
                      location: location,
                      type: type,
                      data: data)
    StorageManger.saveObject(place)
    
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
  
  @objc private func textFieldChanged() {
    saveButton.isEnabled = placeName.text?.isEmpty == false
  }
}

// MARK: - Work with image
extension NewPlaceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func chooseImagePicker(_ source: UIImagePickerController.SourceType) {
    if UIImagePickerController.isSourceTypeAvailable(source) {
      imageIsChanged = true
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      imagePicker.sourceType = source
      present(imagePicker, animated: true)
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    placeImage.image = info[.editedImage] as? UIImage
    placeImage.contentMode = .scaleToFill
    placeImage.clipsToBounds = true
    dismiss(animated: true)
  }
}
