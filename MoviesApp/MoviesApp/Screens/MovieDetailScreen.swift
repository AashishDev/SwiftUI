//
//  MovieDetailScreen.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/22/22.
//

import SwiftUI

struct MovieDetailScreen: View {
    var imdbId:String
    @ObservedObject  var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            }
            else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            else if movieDetailVM.loadingState == .sucess {
                MovieDetailView(movieDetailVM: movieDetailVM)
            }
            Spacer()
        }.onAppear {
            self.movieDetailVM.getMovieById(imdbId: imdbId)
            
        }
        .embedNavigation()
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbId: "0000")
    }
}
