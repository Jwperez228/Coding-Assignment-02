//
//  LandingViewController.swift
//  CaptionThat
//
//  Created by John William Perez on 2/16/20.
//  Copyright © 2020 John William Perez. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI




class LandingViewController: UIViewController {

    

    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorLabel.text = "Jwperez@syr.edu"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handelUserDidTapImageGallery(_ sender: UIButton) {
        showImagePicker()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LandingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = false
        pickerController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        
        
        defer {picker.dismiss(animated: true, completion: nil)}
        
        guard let image = (info[.originalImage] ?? info[.editedImage]) as? UIImage else {
            assertionFailure("Failed to retrieve image after image picker told us an image was picked")
                return
        }
        let img = Picture(image: image)
        initalizeCaptionView(with: img)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func initalizeCaptionView(with picture: Picture) {
        self.performSegue(withIdentifier: "LandingToCaptionedSegue", sender: nil)
    }
}

