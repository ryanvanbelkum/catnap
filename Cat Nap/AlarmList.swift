//
//  AlarmList.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 10/9/23.
//

import Foundation
import SwiftUI


struct RowItem: Identifiable {
    let id = UUID()
    let text: String
    @State var isSwitchOn: Bool
}

class AlarmListModel: ObservableObject {
    @Published var rowItems: [RowItem] = []
    
    private func deleteRow(at indexSet: IndexSet) {
        rowItems.remove(atOffsets: indexSet)
    }
    
    private func addRow(rowItem: RowItem) {
        rowItems.append(rowItem)
    }
}

struct AlarmList: View {
    @State private var rowItems = [
        RowItem(text: "Item 1", isSwitchOn: true),
        RowItem(text: "Item 2", isSwitchOn: false),
        RowItem(text: "Item 3", isSwitchOn: true)
    ]

    var body: some View {
//        NavigationView {
            List {
                ForEach($rowItems) { $item in
                    HStack {
                        Text(item.text)
                        Spacer()
                        Toggle("", isOn: $item.isSwitchOn)
                            .labelsHidden()
                    }
                    .listRowBackground(Color.white.opacity(
                        0.7
                    ))
                    .padding()
                    .background(Color.clear)
                    .listRowInsets(EdgeInsets()) // Remove the row insets
                }
                .onDelete(perform: deleteRow)
            }
            .listStyle(PlainListStyle()) // Use plain list style to remove default list background
            .background(Color.clear) // Set list background to transparent
            
//        }
    }
    
    private func deleteRow(at indexSet: IndexSet) {
        rowItems.remove(atOffsets: indexSet)
    }
}
