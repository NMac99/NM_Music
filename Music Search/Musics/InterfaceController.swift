//
//  ViewController.swift
//  Music Search
//
//  Created by Narek Arsenyan on 5/6/21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit

class InterfaceController: UIViewController {


    @IBOutlet weak var tabelViewReferense: UITableView!
    
    var viewModel = MusicsViewModel()
    var artistss: Artist!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewReferense.dataSource = self
        getData(searchText: artistss.searchText)
        title = artistss.fullname
        tabelViewReferense.delegate = self
    }
    func getData(searchText: String) {
        viewModel.getSongs(completed: { (songs, error) in
            if let error = error {
                print(error.message)
            } else {
                self.tabelViewReferense.reloadData()
            }
        }, searchText: searchText)
    }

}

extension InterfaceController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellConfig") as! TableViewCellConfiguration
        cell.configure(song: viewModel.songs[indexPath.row])
        return cell
    }
    
}
    


extension InterfaceController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vw = self.storyboard?.instantiateViewController(identifier: "mutikuli") as? PlayerController
//        vw?.song = viewModel.songs[indexPath.row]
        vw?.songs = viewModel.songs
        vw?.songRow = indexPath.row
        self.present(vw!, animated: true, completion: nil)
        
    }
    
}

