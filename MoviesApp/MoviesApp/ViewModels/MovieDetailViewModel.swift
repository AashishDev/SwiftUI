//
//  MovieDetailViewModel.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/22/22.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    private var movieDetail: MovieDetail?
    
    @Published var loadingState:LoadingState = .loading
    
    init(movieDetail:MovieDetail? = nil) {
        self.movieDetail =  movieDetail
    }
    
    func getMovieById(imdbId:String) {
        
        self.loadingState =  .loading
        WebService().getMovieDetailByid(imdbId) { result in
            
            switch result {
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.loadingState =  .sucess
                    self.movieDetail =  movieDetail
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState =  .failed
                }
            }
        }
    }
}


extension MovieDetailViewModel {
    
    var title:String {
        return self.movieDetail?.title ?? ""
    }
    
    var poster:String {
        return self.movieDetail?.poster ?? ""
    }
    
    var plot:String {
        return self.movieDetail?.plot ?? ""
    }
    
    var director:String {
        return self.movieDetail?.director ?? ""
    }
    
    var rating:Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
}
