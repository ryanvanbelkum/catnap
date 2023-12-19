//
//  CurrentTime.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 10/4/23.
//

import Foundation
import SwiftUI

struct CurrentTime: View {
    @State private var currentTime: String = ""

    var body: some View {
        VStack {
            Text(currentTime)
                .font(.system(size: 48))
                .foregroundStyle(.white)
        }
        .padding(.top, 20)
        .opacity(0.6)
        .onAppear {
            // Update the current time immediately when the view appears
            updateCurrentTime()
            
            // Update the current time every second
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                updateCurrentTime()
            }
        }
    }
    
    private func updateCurrentTime() {
        let formatter = DateFormatter()
//        formatter.dateFormat = "h:mm a" // Adjust the time format as needed
        formatter.timeStyle = .short
        currentTime = formatter.string(from: Date())
    }
}
