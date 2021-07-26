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
        let armenchik = Artist(name: "Armen", surname: "Hovhannisyan", searchText: "Armenchik")
        let arpi = Artist(name: "Arpi", surname: "Gabrielyan", searchText: "Arpi Gabrielyan")
        let gor = Artist(name: "Gor", surname: "Hakobyan", searchText: "Gor Hakobyan")
        let gore = Artist(name: "Gor", surname: "Yepremyan", searchText: "Gor Yepremyan")
        let lilith = Artist(name: "Lilith", surname: "Hovhannisyan", searchText: "Lilit Hovhannisyan")
        let sirusho = Artist(name: "Sirusho", surname: "Harutyunyan", searchText: "Sirusho")
        let aram = Artist(name: "Aram", surname: "Asatrayn", searchText: "Aram Asatryan")
        let egorKreed = Artist(name: "Egor", surname: "Kreed", searchText: "Egor Kreed");
        let maryGu = Artist(name: "Mary", surname: "Gu", searchText: "Mary Gu")
        let arianaGrande = Artist(name: "Ariana", surname: "Grande", searchText: "Ariana Grande")
        let nickyMinaj = Artist(name: "Nicky", surname: "Minaj", searchText: "Nicky Minaj")
        let dava = Artist(name: "Davit", surname: "Manukyan", searchText: "Dava")
        let jorik = Artist(name: "Michael", surname: "Galstayn", searchText: "Super Zhorik")
        let timati = Artist(name: "Timur", surname: "Eldarovich", searchText: "Timati")
        let miyagi = Artist(name: "Miyagi", surname: "", searchText: "Miyagi")
        let leps = Artist(name: "Grigori", surname: "Leps", searchText: "Leps")
        let morgenshtern = Artist(name: "Alisher", surname: "Tagirovich", searchText: "Morgenshtern")
        let witt = Artist(name: "Witt", surname: "Lowry", searchText: "Witt Lowry")
        let francheska = Artist(name: "Francheska", surname: "", searchText: "francheska")
        let adele = Artist(name: "Adele", surname: "", searchText: "Adele")
        let billie = Artist(name: "Billie", surname: "Eilish", searchText: "Billie Eilish")
        let xxxtentacion = Artist(name: "xxxtentacion", surname: "", searchText: "xxxtentacion")
        let snoop = Artist(name: "Snoop", surname: "Dog", searchText: "Snoop Dog")
        
        
        let armenian = Language(language: .Armenian, artists: [armanHovhannisyan, mihranTsarukyan, armenchik, arpi, aram, gor, gore, lilith, sirusho], pic: UIImage(named: "Armenia")!)
        let russian = Language(language: .Russian, artists: [egorKreed, maryGu, dava, jorik, timati, miyagi, leps, morgenshtern], pic: UIImage(named: "Russia")!)
        let usa = Language(language: .English, artists: [arianaGrande, nickyMinaj, witt, francheska, adele, billie, xxxtentacion, snoop], pic: UIImage(named: "Usa")!)
        
        languages.append(armenian)
        languages.append(russian)
        languages.append(usa)
    }
}
