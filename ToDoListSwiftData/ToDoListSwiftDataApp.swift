//
//  ToDoListSwiftDataApp.swift
//  ToDoListSwiftData
//
//  Created by Bekir Geriş on 4.10.2023.
//

import SwiftUI

@main
struct ToDoListSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListScreen()
            }
        }.modelContainer(for: [ToDo.self])
    }
}
