//
//  MovieListView.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import SwiftUI

struct MovieListView: View {
    let movies:[MovieViewModel]
    
    var body: some View {
        
        List(movies,id:\.imdbid) { movie in
            
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbid)) {
                MovieCell(movie: movie)
            }
        }
    }
}

struct MovieCell:View {
    let movie: MovieViewModel
    
    var body: some View {
     
            HStack(alignment: .top) {
                URLImage(url: movie.poster).frame(width: 100, height: 100).cornerRadius(6)
                
                VStack(alignment: .leading) {
                    
                    Text(movie.title).font(.headline)
                    
                    Text(movie.year).opacity(0.5)
                        .padding(.top,10)
                }.padding(5)
            }.contentShape(Rectangle())
    }
    
}
