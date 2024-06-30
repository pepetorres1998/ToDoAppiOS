//
//  ContentView.swift
//  ToDoApp
//
//  Created by Jose Anonio Torres Garibay on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TodoViewModel()
    @State private var newTitleTodo: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("New Todo", text: $newTitleTodo)
                Button(action: {
                    viewModel.addTodo(title: newTitleTodo)
                    newTitleTodo = ""
                }) {
                    Text("Add Todo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                List {
                    ForEach (viewModel.todos) { todo in
                        HStack {
                            Text(todo.title)
                            Spacer()
                            if(todo.isCompleted) {
                                Image(systemName: "checkmark")
                            }
                        }
                        .onTapGesture {
                            viewModel.updateTodo(todo: todo, title: todo.title, isCompleted: !todo.isCompleted)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            viewModel.deleteTodo(todo: viewModel.todos[index])
                        }
                    })
                }
            }
        }
        .navigationTitle("Todo List")
        .padding()
    }
}

#Preview {
    ContentView()
}
