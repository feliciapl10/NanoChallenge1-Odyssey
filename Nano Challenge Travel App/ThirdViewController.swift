//
//  ThirdViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

import UIKit

class ThirdViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //this is for adding photo from gallery
    @IBAction func PlusButton(_ sender: Any) {
        let picker = UIImagePickerController()
           picker.allowsEditing = true
           picker.delegate = self
           present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // take photo from gallery
        guard let image = info[.editedImage] as? UIImage else { return }
        // change uiimageview after pressed choose and hide the + button
        AddedPhoto.image = image
        AddButton.isHidden = true
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    @IBOutlet weak var AddedPhoto: UIImageView!
    @IBOutlet weak var AddButton: UIButton!
    
//this is the previous button
    @IBAction func previousButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
//this is the next button
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "goNext", sender: self)
    }
    
}
