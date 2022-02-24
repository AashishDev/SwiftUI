//
//  ContentView.swift
//  Shared
//
//  Created by Aashish Tyagi on 2/18/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var counterVM: CounterViewModel
    
    init() {
        self.counterVM =  CounterViewModel()
    }
    
    var body: some View {
        NavigationView {
        
            VStack(alignment: .center) {

            Text(counterVM.premium ? "Premium" : "")
                .font(.largeTitle)
                .foregroundColor(.green)
                .frame(width: 200, height: 100)
            
            Text("\(counterVM.value)")
                .font(.title)
            
            Button("Increment") {
                self.counterVM.increment()
            }.font(.headline)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
             .navigationTitle("Counter App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
