//
//  StoryDetialViewModel.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import Foundation
import Combine

class StoryDetialViewModel: ObservableObject {
    
    @Published private var story = Story.placeholder()
    private var cancellable: AnyCancellable?
    
    func fetchStoryById(_ storyId:Int) {
       
        self.cancellable =  WebService().getStoryById(storyId: storyId)
            .catch { _ in Just(Story.placeholder())}
            .sink(receiveCompletion: {_ in }, receiveValue: { story in
                self.story =  story
            })
    }
}

extension StoryDetialViewModel {
    
    var title:String {
        return self.story.title
    }
    
    var url:String {
        return self.story.url
    }
}
