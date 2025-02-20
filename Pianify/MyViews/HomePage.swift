//
//  HomePage.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 2/18/25.
//

import SwiftUI
import SwiftData

struct DayTask: Identifiable
{
    let id = UUID()
    let name: String
    var isComplete: Bool = false
}

enum Sections: String, CaseIterable
{
    case pending = "Pending"
    case complete = "Complete"
}

struct HomePage: View
{
    @State private var daytasks = [DayTask(name: "Play 1 hr", isComplete: true), DayTask(name: "Practice A major arpeggios")]
    
    var pendingTasks: [Binding<DayTask>]
    {
        $daytasks.filter {!$0.isComplete.wrappedValue}
    }
    
    var completedTasks: [Binding<DayTask>]
    {
        $daytasks.filter {$0.isComplete.wrappedValue}
    }
    
    var body: some View
    {
        List
        {
            ForEach(Sections.allCases, id: \.self)
            { section in
                Section
                {
                    let filteredTasks = section == .pending ? pendingTasks: completedTasks
                    
                    if filteredTasks.isEmpty
                    {
                        Text("No tasks available")
                            .font(.system(size: 17, weight: .light))
                            .foregroundColor(.gray)
                    }
                    
                    ForEach(filteredTasks)
                    { $daytask in
                        DayTaskViewCell(daytask : $daytask)
                    } .onDelete
                    { indexSet in
                        indexSet.forEach
                        { index in
                            let deletedTask = filteredTasks[index]
                            daytasks = daytasks.filter{$0.id != deletedTask.id}
                        }
                    }
                    
                } header:
                {
                    Text(section.rawValue)
                }
                    
            }
        }
    }
}

struct DayTaskViewCell: View
{
    @Binding var daytask: DayTask
    var body: some View
    {
        HStack
        {
            Image(systemName: daytask.isComplete ? "checkmark.square": "square")
                .onTapGesture
                {
                    daytask.isComplete.toggle()
                }
            Text(daytask.name)
        }
    }
}

#Preview {
    HomePage()
}
