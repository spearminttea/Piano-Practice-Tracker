//
//  HomePage.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 2/18/25.
//

import SwiftUI
import SwiftData

struct Task: Identifiable
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
    @State private var tasks = [Task(name: "Play 1 hr", isComplete: true), Task(name: "Practice A major arpeggios")]
    
    var pendingTasks: [Binding<Task>]
    {
        $tasks.filter {!$0.isComplete.wrappedValue}
    }
    
    var completedTasks: [Binding<Task>]
    {
        $tasks.filter {$0.isComplete.wrappedValue}
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
                    { $task in
                        TaskViewCell(task : $task)
                    } .onDelete
                    { indexSet in
                        indexSet.forEach
                        { index in
                            let deletedTask = filteredTasks[index]
                            tasks = tasks.filter{$0.id != deletedTask.id}
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

struct TaskViewCell: View
{
    @Binding var task: Task
    var body: some View
    {
        HStack
        {
            Image(systemName: task.isComplete ? "checkmark.square": "square")
                .onTapGesture
                {
                    task.isComplete.toggle()
                }
            Text(task.name)
        }
    }
}

#Preview {
    HomePage()
}
