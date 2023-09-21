//
//  TimePickerView.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 9/21/23.
//

import SwiftUI
import Foundation

struct TimePickerView: View {
    private let pickerViewTitlePadding: CGFloat = 4.0

    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>


    var body: some View {
        HStack(spacing: -pickerViewTitlePadding) {
            Picker(title, selection: binding) {
                ForEach(range, id: \.self) { timeIncrement in
                    HStack {
                        // Forces the text in the Picker to be
                        // right-aligned
                        Spacer()
                        Text("\(timeIncrement)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .pickerStyle(InlinePickerStyle())
            .labelsHidden()

            Text(title)
                .fontWeight(.bold)
        }
    }
}
