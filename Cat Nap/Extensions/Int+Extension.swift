//
//  Int+Extension.swift
//  Cat Nap
//
//  Created by Ryan Vanbelkum on 10/2/23.
//

import Foundation

extension Int {
    var asTimestamp: String {
        let hour = self / 3600
        let minute = self / 60 % 60
        let second = self % 60

        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
}
