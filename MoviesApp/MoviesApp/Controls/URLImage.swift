//
//  URLImage.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import SwiftUI

struct URLImage:View {
    
    let url:String
    let placeholder:String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url:String, placeholder:String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: url)
    }
    
    var body: some View {
        
        if let data =  self.imageLoader.downloadedData {
            
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        else {
            return Image("placeholder").resizable()
        }
    }
    
}
