//
//  ContentView.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 9/19/23.
//

import SwiftUI

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(
        from: Date()
    )
    return dateString
}


struct ContentView: View {
    @StateObject private var model = TimerViewModel()
    @State private var showNap = false
    @State private var isAnimating = false
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var selectedPeriod = 0
    
    var progressView: some View {
        
        ZStack {
            withAnimation {
                CircularProgressView(
                    progress: $model.progress
                )
            }
            
            VStack {
                Text(
                    model.secondsToCompletion.asTimestamp
                )
                .font(
                    .largeTitle
                )
                HStack {
                    if model.state == .completed {
                        Image(
                            systemName: "bell.fill"
                        )
                        .rotationEffect(
                            isAnimating ? .degrees(
                                -20
                            ) : .degrees(
                                20
                            )
                        )
                        .animation(
                            Animation.easeInOut(
                                duration: 0.3
                            ).repeatForever(
                                autoreverses: true
                            )
                        )
                        .onAppear {
                            self.isAnimating = true
                        }
                    } else {
                        Image(
                            systemName: "bell.fill"
                        )
                    }
                    
                    Text(
                        model.completionDate,
                        format: .dateTime.hour().minute()
                    )
                }
            }
        }
        .frame(
            width: 360,
            height: 255
        )
        .padding(
            .all,
            32
        )
    }
    
    var body: some View {
        ZStack {
            
            Image(
                uiImage: UIImage(
                    named: "orange-cat"
                )!
            )
            .resizable()
            .aspectRatio(
                contentMode: .fill
            )
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            .edgesIgnoringSafeArea(
                .all
            )
            
            VStack {
                
                progressView
                CommonView()
                
                Spacer()
                
                HStack(
                    alignment: .bottom,
                    spacing: 16
                )  {
                    
                    NapButton(showNap: $showNap, model: model)
                }
            }
            .padding(.top, 50)
            .padding(.bottom, 50)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
