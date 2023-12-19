//
//  ContentView.swift
//  CatNap Clip
//
//  Created by Ryan Vanbelkum on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        CommonView()
    }
}

#Preview {
    ContentView()
}
