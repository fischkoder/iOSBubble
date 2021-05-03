//
//  CustomTableViewCell.swift
//  AssignmentTwo
//
//  Created by Fisch on 28/4/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var score: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
