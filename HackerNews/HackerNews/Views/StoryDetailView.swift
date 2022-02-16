//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import SwiftUI

struct StoryDetailView: View {
    
    var storyId:Int
    @ObservedObject private var storyDetialVM:StoryDetialViewModel
    
    init(storyId:Int) {
        self.storyId = storyId
        self.storyDetialVM = StoryDetialViewModel()
    }
    
    var body: some View {
        VStack {
        Text(self.storyDetialVM.title)
        }.onAppear {
            self.storyDetialVM.fetchStoryById(self.storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 100)
    }
}
