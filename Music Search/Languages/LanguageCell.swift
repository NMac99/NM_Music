//
//  LanguageCell.swift
//  Music Search 2
//
//  Created by Narek Arsenyan on 25.06.21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {

    @IBOutlet weak var langPic: UIImageView!
    @IBOutlet weak var langLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(item: Language) -> Void {
        langLabel.text = "\(item.language)"
        langPic.image = item.pic
        
    }
}
