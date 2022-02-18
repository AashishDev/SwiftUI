//
//  ViewModelBase.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, sucess, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
