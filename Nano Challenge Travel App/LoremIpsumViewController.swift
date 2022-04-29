//
//  LoremIpsumViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

import UIKit

// MARK: - Protocol for our own delegate
@objc protocol LoremIpsumViewControllerDelegate: AnyObject { // kl mau dijadiin optional, harus ada @objc
    // Delegate method that can be used
    @objc optional func displayAlert() //bisa dibuat optional karena kl engga maka wajib di implement semua
}

class LoremIpsumViewController: UIViewController {

    var journal : Journal?
    
   //tutorial passing data
    @IBOutlet weak var firstStoryLabel: UILabel!
    @IBOutlet weak var firstSubtitleLabel: UILabel!
    
    
    weak var delegate: LoremIpsumViewControllerDelegate?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    
    //this is data transferred from home page to lorem ipsum page
    override func viewWillAppear(_ animated: Bool) {
            if let journalExist = journal {
                firstStoryLabel.text = journalExist.story
                firstSubtitleLabel.text = journalExist.chapterSubtitle
            }
    }
    
    //this is to transfer data from lorem ipsum to edit controller page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditButton" {
            let destination = segue.destination as? EditViewController
            destination?.journal = journal
        }
    }
    
    //this is the back button
    @IBAction func chevronLeft(_ sender: Any) {
        performSegue(withIdentifier: "gotoHome" , sender: self)
    }
    
    //this is the edit pencil button
    @IBAction func EditButton(_ sender: Any) {
        performSegue(withIdentifier: "EditButton", sender: self)
        print("tapped")
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "toChapter") as! EditViewController
////            self.navigationController?.popToRootViewController(animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)

    }
}

    
