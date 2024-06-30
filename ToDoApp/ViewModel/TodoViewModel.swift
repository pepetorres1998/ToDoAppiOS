//
//  TodoViewModel.swift
//  ToDoApp
//
//  Created by Jose Anonio Torres Garibay on 30/06/24.
//

import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func addTodo(title: String) {
        let newTodo = Todo(title: title, isCompleted: false)
        todos.append(newTodo)
    }

    func updateTodo(todo: Todo, title: String, isCompleted: Bool) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].title = title
            todos[index].isCompleted = isCompleted
        }
    }

    func deleteTodo(todo: Todo) {
        todos.removeAll { $0.id == todo.id }
    }
}
