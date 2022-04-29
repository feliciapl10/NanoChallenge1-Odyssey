//
//  EditViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

import UIKit

class EditViewController: UIViewController, LoremIpsumViewControllerDelegate {

    @IBOutlet weak var TextFieldTitle: UITextField!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var chapterSubtitleTextView: UITextView!
    
    @IBAction func SaveButton(_ sender: Any) {
    
    }
    
    
    var subtitle:String?
    var journal : Journal?
    
    //this is to transfer lorem ipsum subtitle to edit controller
    @IBOutlet weak var chapterSubtitleTextField: UITextField!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        chapterSubtitleTextField.text = journal?.chapterSubtitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapBack))
    }
    
    @objc func tapBack()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "lorem_ipsum") as! LoremIpsumViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func textViewDidBeganEditing(_ textView: UITextView) {
        chapterSubtitleTextField.text = ""
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range:NSRange, replacementText text:String) -> Bool{
        if text=="\n"{
            if let subtitleHasSomething = textView.text {
                subtitle = subtitleHasSomething
            }
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChapter" {
            let detailVC = segue.destination as? LoremIpsumViewController
            detailVC?.journal = Journal(title: "", subtitle: "", image: UIImage(), date: "", location: "", story: "", chapterSubtitle: "")
            // since we already subscribe the delegate from second page, we need to connect it to here
            detailVC?.delegate = self //asking permission untuk access delegate sehingga self punya kewenangan
        }
    }

    //this is the back button
    @IBAction func chevronLeft(_ sender: Any) {
        performSegue(withIdentifier: "gotoChapter" , sender: self)
    }
    
}

