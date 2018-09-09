//
//  TodoInteractor.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/8/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation

let dummyTodos:[Todo] = [
    Todo(text: "Buy Milk. Every Todo has this.", isDone: false, dueDate: Date()),
    Todo(text: "Do something please", isDone: false, dueDate: nil),
    Todo(text: "Every Todo sample has atleast three todos", isDone: true, dueDate: Date()),
]

class TodoInteractor {
    
    weak var output:TodoInteractorOutput?
    
    //We could have a persistant manger to handle the actual datas, but for simplicity interactor will handle the list
    var todos = [Todo]()
}

extension TodoInteractor:TodoUseCase, TodoWorker {

    func numberOfTodos() -> Int {
        return self.todos.count
    }
    
    func getTodo(fromIndex index: Int) -> Todo? {
        // Defensive coding whenever possible
        if index < 0 && index >= self.todos.count {
            return nil
        }
        return self.todos[index]
    }
    
    func fetchTodos() {
        self.todos = dummyTodos
        self.output?.didFetchTodo(totalCount: self.todos.count)
    }

}
