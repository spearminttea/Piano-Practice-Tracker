//
//  IntFormatExtension.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 3/25/2025.
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
