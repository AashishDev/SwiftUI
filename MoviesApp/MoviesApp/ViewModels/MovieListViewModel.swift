//
//  MovieListViewModel.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation

class MovieListViewModel: ViewModelBase {
    
    @Published  var movies = [MovieViewModel]()
    let webService =  WebService()
    
    func searchByName(_ name:String) {
        if name.isEmpty { return }
        
        self.loadingState = .loading
        webService.getMovieByName(name.trimmedAndEscaped()) { result in
            switch result {
                
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .sucess
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.loadingState = .failed
            }
        }
    }
    
}


struct MovieViewModel {
    let movie:Movie
    
    var title: String {
        return movie.title
    }
    
    var poster: String {
        return movie.poster
    }
    
    var year: String {
        return movie.year
    }
    
    var imdbid: String {
        return movie.imdbid
    }
    
}
