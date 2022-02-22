//
//  WebService.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation

enum NetWorkError:Error {
    case badURL
    case noData
    case decodingError
}

class WebService {
    
    func getMovieDetailByid(_ movieId:String, completion: @escaping (Result<MovieDetail,NetWorkError>)-> Void) {
       
       guard let url = URL.movieById(movieId) else {
           return completion(.failure(.badURL))
       }
       
       //let url1 = URL(string: "https://www.omdbapi.com/?s=batman&apikey=7a02ea31")
       
       URLSession.shared.dataTask(with: url) { data, response, error in
           
           guard let data = data, error == nil else {
               return completion(.failure(.noData))
           }

           //Decoding here
           guard  let movieDetail =  try? JSONDecoder().decode(MovieDetail.self, from: data) else {
               return completion(.failure(.decodingError))
           }
           completion(.success(movieDetail))
           
       }.resume()
       
   }
    
    
    
    
     func getMovieByName(_ searchText:String, completion: @escaping (Result<[Movie]?,NetWorkError>)-> Void) {
        
        guard let url = URL.movieByName(searchText) else {
            return completion(.failure(.badURL))
        }
        
        //let url1 = URL(string: "https://www.omdbapi.com/?s=batman&apikey=7a02ea31")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            //Decoding here
            guard  let movieResponse =  try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieResponse.movies))
            
        }.resume()
        
    }
}
