//
//  StoryListView.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import SwiftUI
import Combine

struct StoryListView: View {
    
    @ObservedObject private var storyListVM =  StoryListViewModel()
    var body: some View {
        
        NavigationView {
            List(self.storyListVM.stories, id: \.id) { storyVM in
                
                NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
                    Text("\(storyVM.id)")
                }
            }
        }.navigationBarTitle("Hacker News")
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
