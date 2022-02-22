//
//  MovieListScreen.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject private var movieListVM : MovieListViewModel
    @State var movieName:String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        
        VStack {
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                self.movieListVM.searchByName(self.movieName)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
                .navigationTitle("Movies").foregroundColor(.black)
            
            //Handle Loading State
            if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
            else if self.movieListVM.loadingState == .failed {
                FailedView()
            }
            else if self.movieListVM.loadingState == .sucess {
                MovieListView(movies: self.movieListVM.movies)
            }
        }
        .padding()
        .embedNavigation()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
