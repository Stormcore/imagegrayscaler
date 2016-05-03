//
//  ViewController.swift
//  ImageConverterApp
//
//  Created by Dzmitry Sukhau on 5/3/16.
//  Copyright © 2016 Dzmitry Sukhau. All rights reserved.
//

import ImageProcessor
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var processedImageView: UIImageView!
  
  let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func SelectImage(sender: AnyObject) {
    imagePicker.allowsEditing = false
    imagePicker.sourceType = .PhotoLibrary
    
    presentViewController(imagePicker, animated: true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      let processedImage = processImage(pickedImage)
      processedImageView.image = processedImage
    }
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func processImage(image: UIImage) -> UIImage {
    return ImageProcessor.convertToGrayScale(image)
  }
}
