//
//  ImageLoader.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation

class ImageLoader:ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url:String) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {  return }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
    }
}
