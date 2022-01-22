//
//  ViewController.swift
//  gyros-identifier
//
//  Created by Alex Tzimas on 20/1/22.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let imagePicker = UIImagePickerController()
    let imageAlbumPicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var introLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert to CIImage.")
            }
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    private func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: GyrosClassifier3().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) {
                (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                        fatalError("Model failed to process image.")
                    }
                if let firstResult = results.first {
                    print(firstResult)
                    if firstResult.identifier.contains("gyros") ||
                        firstResult.identifier.contains("breakfast_burrito"){
                        self.navigationItem.title = "Gyros ✅"
                    } else {
                        self.navigationItem.title = "Not Gyros ❌"
                    }
                }
            }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    

    @IBAction func cameraAction(_ sender: Any) {
        introLabel.isHidden = true
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func loadImageAction(_ sender: Any) {
        introLabel.isHidden = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        introLabel.isHidden = true
    }
    
    
}

