//
//  URL+Extension.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation

extension URL {
    static func movieByName(_ name:String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constant.API_KEY)")
    }
    
}
