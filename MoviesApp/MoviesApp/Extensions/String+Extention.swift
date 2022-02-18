//
//  String+Extentions.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        let trimmedString =  self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
