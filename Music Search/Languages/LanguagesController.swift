//
//  LanguagesController.swift
//  Music Search 2
//
//  Created by Narek Arsenyan on 25.06.21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit

class LanguagesController: UIViewController{
   
    @IBOutlet weak var langTableRef: UITableView!
    let viewModel = LanguageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        langTableRef.dataSource = self
        langTableRef.delegate = self
        title = "Choose Language"
        
    }
}

extension LanguagesController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellLanguages") as! LanguageCell
        cell.configure(item: viewModel.languages[indexPath.row] )
        return cell
    }
}

extension LanguagesController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vw = self.storyboard?.instantiateViewController(identifier: "artistController") as! ArtistsController
        vw.language = viewModel.languages[indexPath.row]
        self.navigationController?.pushViewController(vw, animated: true)
    }
}
