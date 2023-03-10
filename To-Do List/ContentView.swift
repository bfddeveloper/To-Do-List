//
//  ContentView.swift
//  To-Do List
//
//  Created by Brody Dickson on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoItems =
            [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
             ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
             ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView{
            List{
                ForEach(toDoItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove{ indices, newOffset in
                    toDoItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete{ IndexSet in
                    toDoItems.remove(atOffsets: IndexSet)
                }
            }
            .navigationBarTitle("To Do List")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
    
}
