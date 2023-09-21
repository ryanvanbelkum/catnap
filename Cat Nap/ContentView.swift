//
//  ContentView.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 9/19/23.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var selectedHoursAmount = 10
    @Published var selectedMinutesAmount = 10
    @Published var selectedSecondsAmount = 10

    let hoursRange = 0...23
    let minutesRange = 0...59
    let secondsRange = 0...59
}


func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}


struct ContentView: View {
    @StateObject private var model = TimerViewModel()
    @State private var showAlarm = false
    @State private var showNap = false
    
    var body: some View {
        ZStack {

            Image(uiImage: UIImage(named: "orange-cat")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            
               
            VStack {
                
                Text(getTime()).font(.system(size: 28)).padding(10)
                Spacer()
                                        
                HStack(alignment: .bottom, spacing: 16)  {
                    Button(action: {
                        showAlarm.toggle()
                    }) {
                        VStack {
                            Image(systemName: "alarm")
                                .font(.system(size: 30))
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Text("Alarm").font(.system(size: 14))
                        }.foregroundColor(Color(.black))
                            .font(.system(size: 30))
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .padding(30)
                            .background(Color.white.opacity(0.7))
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }.sheet(isPresented: $showAlarm) {
                        HStack() {
                                    TimePickerView(title: "hours",
                                        range: model.hoursRange,
                                        binding: $model.selectedHoursAmount)
                                    TimePickerView(title: "min",
                                        range: model.minutesRange,
                                        binding: $model.selectedMinutesAmount)
                                    TimePickerView(title: "sec",
                                        range: model.secondsRange,
                                        binding: $model.selectedSecondsAmount)
                            
                                }
                                .padding(.all, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.black)
                                .foregroundColor(.white)
                                .presentationDetents([.medium, .large])
                    }
                    Button(action: {
                        showNap.toggle()
                    }) {
                        VStack {
                            Image(systemName: "timer")
                                .font(.system(size: 30))
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Text("Nap").font(.system(size: 14))
                        }.foregroundColor(Color(.black))
                            .font(.system(size: 30))
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .padding(30)
                            .background(Color.white.opacity(0.7))
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }.sheet(isPresented: $showNap) {
                        Text("This app was brought to you by Hacking with Swift")
                            .presentationDetents([.medium, .large])
                    }
             
                }
            }.padding(50)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
