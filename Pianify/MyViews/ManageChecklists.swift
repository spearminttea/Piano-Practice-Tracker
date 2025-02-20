//
//  ManageChecklists.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 2/20/25.
//

import SwiftUI
import SwiftData

struct AllTask: Identifiable
{
    let id = UUID()
    let name: String
    var myDay: String
}

enum Days: String, CaseIterable
{
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

struct ManageChecklists: View
{
    
    @State private var alltasks = [AllTask(name: "Play 1 hr", myDay: "Monday"), AllTask(name: "Practice A major arpeggios", myDay: "Wednesday"), AllTask(name: "Practice melodic minors", myDay: "Sunday")]
    
    var monTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Monday")}
    }
    
    var tueTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Tuesday")}
    }
    
    var wedTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Wednesday")}
    }
    
    var thuTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Thursday")}
    }
    
    var friTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Friday")}
    }
    
    var satTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Saturday")}
    }
    
    var sunTasks: [Binding<AllTask>]
    {
        $alltasks.filter {($0.myDay.wrappedValue == "Sunday")}
    }
    
    var body: some View
    {
        List
        {
            ForEach(Days.allCases, id: \.self)
            {
                section in
                    Section
                    {
                        
                        var filteredTasks = section == .monday ? monTasks : sunTasks
                        
                        
//                        if filteredTasks.isEmpty
//                        {
//                            Text("No tasks available")
//                                .font(.system(size: 17, weight: .light))
//                                .foregroundColor(.gray)
//                        }
//                        
//                        ForEach(filteredTasks)
//                        { $alltask in
//                            AllTaskViewCell(alltasks : $alltasks)
//                        } .onDelete
//                        { indexSet in
//                            indexSet.forEach
//                            { index in
//                                let deletedTask = filteredTasks[index]
//                                alltasks = alltasks.filter{$0.id != deletedTask.id}
//                            }
//                        }
                        
                    } header:
                    {
                        Text(section.rawValue)
                    }
            }
        }
        
    }
}

struct AllTaskViewCell: View
{
    @Binding var alltask: AllTask
    var body: some View
    {
        HStack
        {
            Image(systemName: "square")
            Text(alltask.name)
        }
    }
}


#Preview {
    ManageChecklists()
}
