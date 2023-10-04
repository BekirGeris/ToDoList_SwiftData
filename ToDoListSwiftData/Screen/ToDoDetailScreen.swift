//
//  ToDoDetailScreen.swift
//  ToDoListSwiftData
//
//  Created by Bekir Geriş on 4.10.2023.
//

import SwiftUI

struct ToDoDetailScreen: View {
        
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var priority: Int?

    let toDo: ToDo
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priority", value: $priority, format: .number)
        }
        .navigationTitle("Detail ToDo")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    //Save
                    guard let priority = priority else {return}
                    toDo.name = name
                    toDo.priority = priority
                    
                    context.insert(toDo)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }, label: {
                    Text("Update")
                }).disabled(!isFormValid)
            }
        }
        .onAppear(perform: {
            name = toDo.name
            priority = toDo.priority
        })
    }
}

//#Preview {
//    NavigationStack {
//        ToDoDetailScreen(toDo: ToDo(name: "nkvfs", priority: 334))
//            .modelContainer(for: [ToDo.self])
//    }
//}
