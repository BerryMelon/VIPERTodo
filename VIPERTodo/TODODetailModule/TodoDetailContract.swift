//
//  TodoDetailContract.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/9/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation

protocol TodoDetailView: class {
    func reload(withTodoData todoData:TodoRepresentType)
}

protocol TodoDetailPresentation: class {
    func onViewDidLoad()
}

protocol TodoDetailUseCase: class {
    func createTodoRepresentationType(todo:Todo) -> TodoRepresentType
}

protocol TodoDetailWireframe: class {
}
