//
//  NapButton.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 10/25/23.
//

import Foundation
import SwiftUI



struct NapButton: View {
    @Binding var showNap : Bool
    @ObservedObject var model : TimerViewModel
    
    var timerControls: some View {
        HStack {
            Button(
                "Cancel"
            ) {
                model.state = .cancelled
            }
            .buttonStyle(
                CancelButtonStyle()
            )
            
            Spacer()
            
            switch model.state {
            case .cancelled, .completed:
                Button(
                    "Start"
                ) {
                    model.state = .active
                    showNap = false
                }
                .buttonStyle(
                    StartButtonStyle()
                )
            case .paused:
                Button(
                    "Resume"
                ) {
                    model.state = .resumed
                    showNap = false
                }
                .buttonStyle(
                    PauseButtonStyle()
                )
            case .active, .resumed:
                Button(
                    "Pause"
                ) {
                    model.state = .paused
                }
                .buttonStyle(
                    PauseButtonStyle()
                )
            }
        }
        .padding(
            .horizontal,
            32
        )
    }
    
    var body: some View {
        Button(action: {
            showNap.toggle()
        }) {
            VStack {
                Image(
                    systemName: "timer"
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
                    "Nap"
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
            isPresented: $showNap
        ) {
            
            VStack {
                HStack() {
                    TimePickerView(
                        title: "hours",
                        range: model.hoursRange,
                        binding: $model.selectedHoursAmount
                    )
                    TimePickerView(
                        title: "min",
                        range: model.minutesRange,
                        binding: $model.selectedMinutesAmount
                    )
                    TimePickerView(
                        title: "sec",
                        range: model.secondsRange,
                        binding: $model.selectedSecondsAmount
                    )
                    
                }
                .padding(
                    .all,
                    32
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                
                
                timerControls
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

