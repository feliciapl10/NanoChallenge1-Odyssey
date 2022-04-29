//
//  ViewController.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var array: [Journal] = [Journal(title: "Lorem Ipsum", subtitle: "This is lorem ipsum subtitle", image: UIImage(named: "loremipsum")!, date: "Wednesday, 27 April 2022", location: "Bandung, Indonesia", story: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", chapterSubtitle: "What is lorem ipsum?"),
        Journal(title: "Veni Vidi Vici", subtitle: "Means I came, I saw, I conquered", image: UIImage(named: "venividivici")!, date: "Thursday, 28 April 2022", location: "Jakarta, Indonesia", story: "this is the content of the veni vidi vici story", chapterSubtitle: "What is veni vidi vici?")
    ]

    @IBOutlet weak var TableViewHome: UITableView!
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewHome.delegate = self
        TableViewHome.dataSource = self
        TableViewHome.register(UINib(nibName: "JournalHome", bundle: nil), forCellReuseIdentifier: "JournalHome")
        
    }
    @IBAction func createNewEntry(_ sender: Any) {
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewHome.dequeueReusableCell(withIdentifier: "JournalHome") as? JournalHome
        cell?.JournalTitle.text = array[indexPath.row].title
        cell?.JournalSubtitle.text = array[indexPath.row].subtitle
        cell?.JournalDate.text = array[indexPath.row].date
        cell?.JournalLocation.text = array[indexPath.row].location
        cell?.JournalPhoto.image = array[indexPath.row].image

        return cell ?? JournalHome()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "toDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    // Set the spacing between sections
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 5.0
        }
    
    //ini buat tableview title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Journal"
//    }
    
    //this is to transfer data to the lorem ipsum page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let journal = array[selectedIndex]
        if segue.identifier == "toDetails" {
            let detailVC = segue.destination as? LoremIpsumViewController
            detailVC?.journal = journal
        }
    }
    
}

