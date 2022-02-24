//
//  CounterViewModel.swift
//  SimpleCounterMVVM (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation
import SwiftUI

class CounterViewModel: ObservableObject {
    @Published private var counter =  Counter()
    
    var value:Int {
        counter.value
    }
    
    var premium: Bool {
        counter.isPremium
    }
    
    func increment() {
        counter.increment()
    }
    
}
