//
//  MovieDetailView.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/22/22.
//

import SwiftUI

struct MovieDetailView: View {
    var movieDetailVM:MovieDetailViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: self.movieDetailVM.poster)
                    .cornerRadius(8)
                
                Text(movieDetailVM.title).font(.title)
                Text(movieDetailVM.plot)
                
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                
                HStack {
                    RatingView(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top,10)
            }.padding()
            .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}

