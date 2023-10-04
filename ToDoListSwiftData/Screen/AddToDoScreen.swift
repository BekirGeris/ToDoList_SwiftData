//
//  ContentView.swift
//  ToDoListSwiftData
//
//  Created by Bekir Geriş on 4.10.2023.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var priority: Int?
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priority", value: $priority, format: .number)
        }
        .navigationTitle("Add ToDo")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    //dismis
                    dismiss()
                }, label: {
                    Text("Dismis")
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    //Save
                    guard let priority = priority else {return}
                    let toDo = ToDo(name: name, priority: priority)
                    context.insert(toDo)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }, label: {
                    Text("Save")
                }).disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddToDoScreen()
            .modelContainer(for: [ToDo.self])
    }
}
