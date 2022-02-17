//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    private var cancellable : AnyCancellable?
    @Published var stories = [StoryViewModel]()
    
    init() {
        fetchTopStories()
    }
    
    func fetchTopStories() {
        cancellable =  WebService().getTopStories().map { storyIds in
            storyIds.map { StoryViewModel(story: $0)}
        }.sink(receiveCompletion: {_ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
    }
    
}

struct StoryViewModel {
    
    let story: Story
    
    var id:Int {
        return self.story.id
    }
    
    var title:String {
        return self.story.title
    }
    
    var url:String {
        return self.story.url
    }
}
