//
//  SecondViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var journal : Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let journalObject = journal {
            titleLabel.text = journalObject.title
        }
       
        //Ini supaya text view yang ada di new entry supaya ada placeholdernya
        TextView.delegate = self
        TextView.text = "Insert text here"
        TextView.textColor = .lightGray
    
        //this is to make the label as a button (ignore)
        titleLabel.isUserInteractionEnabled = true
        let tapped = UITapGestureRecognizer(target: self, action: #selector(responseTapped(_:)))
        titleLabel.addGestureRecognizer(tapped)
        
    }
    
    @objc private func responseTapped (_ gesture : UITapGestureRecognizer) {
        print("test")
    }

    //this is Next button
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }

}

//ini juga buat text fieldnya ga kosong (ada placeholder)
extension SecondViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == self.TextView {
            if textView.text == "Insert text here" {
                textView.text = nil
                textView.textColor = .black
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == self.TextView {
            if textView.text.count == 0 {
                textView.text = "Insert text here"
                textView.textColor = .lightGray
            }
        }
    }
}
