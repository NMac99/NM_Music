//
//  ArtistsController.swift
//  Music Search 2
//
//  Created by Narek Arsenyan on 28.06.21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit

class ArtistsController: UIViewController {

    var language: Language!
    
    @IBOutlet weak var navTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(language.language)"
        navTable.dataSource = self
        navTable.delegate = self
    }

}

extension ArtistsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return language.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier") as! ArtistCell
        cell.artist(language.artists[indexPath.row])
        return cell
    }
    
}

extension ArtistsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vwc = storyboard?.instantiateViewController(identifier: "1234567890") as! InterfaceController
        vwc.artistss = language.artists[indexPath.row]
        navigationController?.pushViewController(vwc, animated: true)
    }
}
