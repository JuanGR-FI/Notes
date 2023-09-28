//
//  NoteCell.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 23/09/23.
//

import UIKit

class NoteCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
