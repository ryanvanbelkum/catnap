//
//  AlarmButton.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 10/25/23.
//

import Foundation
import SwiftUI

struct AlarmButton: View {
    @State private var showAlarm = false
    @Binding var selectedHour : Int
    @Binding var selectedMinute : Int
    @Binding var selectedPeriod : Int
    
    private let hours = Array(1...12)
    private let minutes = Array(0..<60)
    private let periods = ["AM", "PM"]

    var body: some View {
        Button(action: {
            showAlarm.toggle()
        }) {
            VStack {
                Image(
                    systemName: "alarm"
                )
                .font(
                    .system(
                        size: 30
                    )
                )
                .imageScale(
                    .large
                )
                .foregroundColor(
                    .black
                )
                Text(
                    "Alarm"
                ).font(
                    .system(
                        size: 14
                    )
                )
            }.foregroundColor(
                Color(
                    .black
                )
            )
            .font(
                .system(
                    size: 30
                )
            )
            .imageScale(
                .large
            )
            .foregroundColor(
                .black
            )
            .padding(
                30
            )
            .background(
                Color.white.opacity(
                    0.7
                )
            )
            .frame(
                width: 100,
                height: 100
            )
            .clipShape(
                Circle()
            )
            .shadow(
                radius: 10
            )
        }.sheet(
            isPresented: $showAlarm
        ) {
            VStack {
                HStack {
                    Picker("Hour", selection: $selectedHour) {
                        ForEach(hours, id: \.self) { hour in
                            Text("\(hour)")
                                .tag(hour)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .clipped()
                    
                    Picker("Minute", selection: $selectedMinute) {
                        ForEach(minutes, id: \.self) { minute in
                            Text("\(minute)")
                                .tag(minute)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .clipped()
                    
                    Picker("Period", selection: $selectedPeriod) {
                        ForEach(0..<periods.count, id: \.self) { index in
                            Text(self.periods[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    .clipped()
                }
                .padding(
                    .all,
                    32
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            }.background(
                .black
            )
            .foregroundColor(
                .white
            )
            .presentationDetents(
                [
                    .medium,
                    .large
                ]
            )
            
        }
    }
}


