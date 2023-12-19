//
//  StartButtonStyle.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 10/2/23.
//

import Foundation
import SwiftUI

struct PauseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70, height: 70)
            .foregroundColor(Color(.orange))
            .background(Color(.orange).opacity(0.3))
            .clipShape(Circle())
            .padding(.all, 3)
            .overlay(
                Circle()
                    .stroke(Color(.orange).opacity(0.3), lineWidth: 2)
            )
    }
}

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70, height: 70)
            .foregroundColor(Color(.green))
            .background(Color(.green).opacity(0.3))
            .clipShape(Circle())
            .padding(.all, 3)
            .overlay(
                Circle()
                    .stroke(Color(.green)
                        .opacity(0.3), lineWidth: 2)
            )
    }
}

struct CancelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70, height: 70)
            .foregroundColor(Color(.white))
            .background(Color(.blue).opacity(0.3))
            .clipShape(Circle())
            .padding(.all, 3)
            .overlay(
                Circle()
                    .stroke(Color(.blue).opacity(0.3), lineWidth: 2)
            )
    }
}
