//
//  Todo.swift
//  ToDoApp
//
//  Created by Jose Anonio Torres Garibay on 30/06/24.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
