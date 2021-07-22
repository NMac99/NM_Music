//
//  ArtistCell.swift
//  Music Search 2
//
//  Created by Narek Arsenyan on 28.06.21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit

class ArtistCell: UITableViewCell {
    
    @IBOutlet weak var tabelImage: UIImageView!
    @IBOutlet weak var tabelLabelUp: UILabel!
    @IBOutlet weak var tabelLabelDown: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func artist(_ info: Artist) {
        tabelLabelUp.text = info.name
        tabelLabelDown.text = info.surname
    }
}
