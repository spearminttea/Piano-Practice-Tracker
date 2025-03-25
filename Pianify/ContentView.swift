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
                    Image("Checklist Icon")
                }
            Metronome()
                .tabItem()
                {
                    Image("Metronome Icon")
                }
            TimerView()
                .tabItem()
                {
                    Image("Timer Icon")
                }
            MyCalendar()
                .tabItem()
                {
                    Image("Calendar Icon")
                }
            HabitTracker()
                .tabItem()
                {
                    Image("Habit Tracker Icon")
                }
        }
    }
}

#Preview {
    ContentView()
}
