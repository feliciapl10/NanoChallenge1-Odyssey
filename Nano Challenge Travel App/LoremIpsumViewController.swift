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
    @IBOutlet weak var label: UILabel!
    
    var subtitle:String?
    weak var delegate: LoremIpsumViewControllerDelegate?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        label.text = myString
//
//    }
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    
    override func viewWillAppear(_ animated: Bool) {
            if let subtitleExist = subtitle {
                label.text = subtitleExist
            }
        }
    
    //this is the back button
    @IBAction func chevronLeft(_ sender: Any) {
        performSegue(withIdentifier: "gotoHome" , sender: self)
    }
    
    //this is the edit pencil button
    @IBAction func EditButton(_ sender: Any) {
        performSegue(withIdentifier: "EditButton", sender: self)
    }
    
}

    
