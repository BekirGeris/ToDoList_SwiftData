//
//  ToDoListView.swift
//  ToDoListSwiftData
//
//  Created by Bekir Geriş on 4.10.2023.
//

import SwiftUI

struct ToDoListView: View {
    
    let toDos: [ToDo]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
            }
            .onDelete { indexSet in
                if let firstIndex = indexSet.first {
                    let toDo = toDos[firstIndex]
                    context.delete(toDo)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .navigationDestination(for: ToDo.self) { todo in
            ToDoDetailScreen(toDo: todo)
        }
    }
}

//#Preview {
//    ToDoListView(toDos: [ToDo(name: "bekbek", priority: 2)])
//        .modelContainer(for: [ToDo.self])
//}
