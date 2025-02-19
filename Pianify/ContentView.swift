//
//  ContentView.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 1/27/25.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        TabView
        {
            HomePage()
                .tabItem()
                {
                    Image("Checklist")
                }
            Audio()
                .tabItem()
                {
                    Image("Audio")
                }
            Metronome()
                .tabItem()
                {
                    Image("Metronome")
                }
            MyTimer()
                .tabItem()
                {
                    Image("Timer")
                }
            MyCalendar()
                .tabItem()
                {
                    Image("Calendar")
                }
            HabitTracker()
                .tabItem()
                {
                    Image("Habit Tracker")
                }
        }
    }
}

#Preview {
    ContentView()
}
