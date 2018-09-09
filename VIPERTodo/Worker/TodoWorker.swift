//
//  TodoWorker.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/9/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation

protocol TodoWorker {}
extension TodoWorker {
    func createTodoRepresentationType(todo:Todo) -> TodoRepresentType {
        // This has been moved from the TodoPresenter
        let todoStr = todo.text
        let isDone = todo.isDone
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateStr = todo.dueDate == nil ? "" : dateFormatter.string(from: todo.dueDate!)
        return TodoRepresentType(todoStr,isDone,dateStr)
    }
}
