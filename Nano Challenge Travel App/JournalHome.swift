//
//  JouralHome.swift
//  Nano Challenge Travel App
//
//  Created by Felicia Prisqilla on 28/04/22.
//

import UIKit

struct Journal {
    var title: String
    var subtitle: String
    var image: UIImage
    var date: String
    var location: String
}

class JournalHome: UITableViewCell {

    @IBOutlet weak var JournalPhoto: UIImageView!
    @IBOutlet weak var JournalTitle: UILabel!
    @IBOutlet weak var JournalSubtitle: UILabel!
    @IBOutlet weak var JournalDate: UILabel!
    @IBOutlet weak var JournalLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
