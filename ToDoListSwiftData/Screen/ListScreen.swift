//
//  ListView.swift
//  ToDoListSwiftData
//
//  Created by Bekir Geriş on 4.10.2023.
//

import SwiftUI
import SwiftData

struct ListScreen: View {
    
    @Query(sort: \ToDo.name, order: .forward) private var toDos: [ToDo]
    @State private var isAddToDoPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ToDoListView(toDos: toDos)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isAddToDoPresented = true
                }, label: {
                    Text("Add ToDo")
                })
            }
        }
        .sheet(isPresented: $isAddToDoPresented, content: {
            NavigationStack {
                AddToDoScreen()
            }
        })
    }
}

#Preview {
    NavigationStack {
        ListScreen().modelContainer(for: [ToDo.self])
    }
}
