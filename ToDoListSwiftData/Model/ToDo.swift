//
//  ToDo.swift
//  ToDoListSwiftData
//
//  Created by Bekir Geriş on 4.10.2023.
//

import Foundation
import SwiftData

@Model
class ToDo {
    var name: String
    var priority: Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
