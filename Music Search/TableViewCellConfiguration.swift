//
//  TableViewCellConfiguration.swift
//  Music Search
//
//  Created by Narek Arsenyan on 5/6/21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit

class TableViewCellConfiguration: UITableViewCell {


    @IBOutlet weak var songpic: UIImageView!
    @IBOutlet weak var labelUp: UILabel!
    @IBOutlet weak var labelDown: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(song: SongData) {
        labelUp.text = song.artistName
        labelDown.text = song.trackName
        
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: song.artworkUrl60) {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.songpic.image = UIImage(data: data)

                        if self.songpic.image !== nil {
                            self.songpic.layer.cornerRadius = self.songpic.bounds.width / 2
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
