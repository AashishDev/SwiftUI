//
//  StoryListView.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/16/22.
//

import SwiftUI
import Combine

struct StoryListView: View {
    
    init() {
        //UINavigationBar.appearance().backgroundColor = .systemBlue
        //UINavigationBar.appearance().largeTitleTextAttributes = [
              //  .foregroundColor: UIColor.white]
    }
    
    @ObservedObject private var storyListVM =  StoryListViewModel()
    var body: some View {
        
        NavigationView {
            List(self.storyListVM.stories, id: \.id) { storyVM in
                
                NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
                    Text("\(storyVM.title)")
                }
            }
            .navigationBarTitle("Hacker News")
        }
    }

}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
