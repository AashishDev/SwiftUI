//
//  Story.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import Foundation

struct Story: Codable {
    
    let id:Int
    let title:String
    let url:String
}


extension Story {
    
    static func placeholder() -> Story {
        return Story(id:0, title: "N/A", url: "")
    }
    
}
