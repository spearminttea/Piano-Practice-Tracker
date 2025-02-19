//
//  PianifyApp.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 1/27/25.
//

import SwiftUI
import SwiftData

@main
struct PianifyApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
    }
}

@Model class Checklist
{
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

