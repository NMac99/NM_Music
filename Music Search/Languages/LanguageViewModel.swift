//
//  LanguageViewModel.swift
//  Music Search 2
//
//  Created by Narek Arsenyan on 25.06.21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//
import UIKit

class LanguageViewModel {
    var languages: [Language] = []
    
    init() {
        let armanHovhannisyan = Artist(name: "Arman", surname: "Hovhannisyan", searchText: "Arman Hovhannisyan");
        let mihranTsarukyan = Artist(name: "Mihran", surname: "Tsarukyan", searchText: "Mihran Tsarukyan")
        let egorKreed = Artist(name: "Egor", surname: "Kreed", searchText: "Egor Kreed");
        let maryGu = Artist(name: "Mary", surname: "Gu", searchText: "Mary Gu")
        let arianaGrande = Artist(name: "Ariana", surname: "Grande", searchText: "Ariana Grande")
        let nickyMinaj = Artist(name: "Nicky", surname: "Minaj", searchText: "Nicky Minaj")
        
        let armenian = Language(language: .Armenian, artists: [armanHovhannisyan, mihranTsarukyan], pic: UIImage(named: "Armenia")!)
        let russian = Language(language: .Russian, artists: [egorKreed, maryGu], pic: UIImage(named: "Russia")!)
        let usa = Language(language: .English, artists: [arianaGrande, nickyMinaj], pic: UIImage(named: "Usa")!)
        
        languages.append(armenian)
        languages.append(russian)
        languages.append(usa)
    }
}
