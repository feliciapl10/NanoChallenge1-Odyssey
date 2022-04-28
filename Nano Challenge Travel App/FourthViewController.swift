//
//  FourthViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //this is the back button
    @IBAction func chevronLeft(_ sender: Any) {
        performSegue(withIdentifier: "goToDetail" , sender: self)
    }
    
}
