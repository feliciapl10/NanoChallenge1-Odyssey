//
//  EditViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

import UIKit

class EditViewController: UIViewController, LoremIpsumViewControllerDelegate {
    

    var subtitle:String?

    @IBOutlet weak var textField: UITextField!
    
//    @IBAction func Save(_ sender: Any) {
//        if textField.text != "" {
//            performSegue(withIdentifier: "segue", sender: self)
//        }
//            
//    }
    func textViewDidBeganEditing(_ textView: UITextView) {
        textView.text=""
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
            detailVC?.subtitle = subtitle
            // since we already subscribe the delegate from second page, we need to connect it to here
            detailVC?.delegate = self //asking permission untuk access delegate sehingga self punya kewenangan
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var LoremIpsumViewController = segue.destination as! LoremIpsumViewController
//        LoremIpsumViewController.myString = textField.text!
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "toDetailStorySegue" {
//                let detailVC = segue.destination as? DetailViewController
//                detailVC?.storyMessage = story
//                // since we already subscribe the delegate from second page, we need to connect it to here
//                detailVC?.delegate = self //asking permission untuk access delegate sehingga self punya kewenangan
//            }
//        }
    

}
