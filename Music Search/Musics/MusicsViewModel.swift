//
//  MusicsViewModel.swift
//  Music Search
//
//  Created by Narek Arsenyan on 5/6/21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import Foundation

enum MyError {
    case parse
    case unknown
    
    var message: String {
        switch self {
            case .parse:
                return "parse error"
            case .unknown:
                return "unknown error"
        }
    }
}

class MusicsViewModel {
    var songs: [SongData] = []
    
    func getSongs(completed: @escaping ([SongData]?, MyError?) -> Void, searchText: String?) {
        if let searchText = searchText {
            let searchText2 = searchText.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
            if let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(searchText2)") {
                let fetchingTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            completed(nil,MyError.unknown)
                        }
                    } else {
                        if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data {
                            do {
                                let responseData = try JSONDecoder().decode(ResultData.self, from: data)
                                self.songs = []
                                self.songs.append(contentsOf: responseData.results)
                                DispatchQueue.main.async {
                                    completed(self.songs, nil)
                                }
                            } catch {
                                DispatchQueue.main.async {
                                    completed(nil,MyError.parse)
                                    print(error)
                                }
                            }
                        }
                    }
                }
                fetchingTask.resume()
            }
        } else {
            
        }
    }
}
