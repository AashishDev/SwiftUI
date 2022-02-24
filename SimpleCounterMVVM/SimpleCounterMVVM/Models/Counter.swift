//
//  Counter.swift
//  SimpleCounterMVVM (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//
import Foundation

struct Counter {
    var value:Int = 0
    var isPremium:Bool =  false
    
    mutating func increment() {
        value += 1
        isPremium = value.isMultiple(of: 3)
    }
    
}
