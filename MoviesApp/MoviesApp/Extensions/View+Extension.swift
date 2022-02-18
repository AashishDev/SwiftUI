//
//  View+Extension.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigation() -> some View {
        return NavigationView { self }
    }
}
