//
//  TodoProtocols.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/8/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation
import UIKit

protocol TodoView: class {
    func reload(numberOfRows:Int)
}

protocol TodoPresentation: class {
    
    func onViewDidLoad()
    func onTappedAddButton()
    func onTappedTodo(atIndex index:Int)
    func requestTodo(forIndex index:Int) -> TodoRepresentType?
}

protocol TodoUseCase: class {
    func fetchTodos()
    func numberOfTodos() -> Int
    func getTodo(fromIndex index:Int) -> Todo?
    func createTodoRepresentationType(todo:Todo) -> TodoRepresentType
}

protocol TodoInteractorOutput: class {
    func didFetchTodo(totalCount:Int)
}

protocol TodoRouteProtocol: class {
    func moveToAddScreen()
    func moveToTodoDetail(withTodo todo:Todo)
}
