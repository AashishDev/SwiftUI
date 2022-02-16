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
            storyIds.map { StoryViewModel(id: $0)}
        }.sink(receiveCompletion: {_ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
    }
    
}

struct StoryViewModel {
    let id:Int
}
