//
//  WebServices.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import Foundation
import Combine

class WebService {
    
    func getTopStories() -> AnyPublisher<[Int],Error> {
        
        guard let url =  URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
            fatalError("Invalid Url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getStoryById(storyId:Int) -> AnyPublisher <Story,Error> {
        
        guard let url =  URL(string: "https://hacker-news.firebaseio.com/v0/item/\(storyId).json?print=pretty") else {
            fatalError("Invalid Url")
        }
        
        return  URLSession.shared.dataTaskPublisher(for: url)
            .receive(on:RunLoop.main)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
