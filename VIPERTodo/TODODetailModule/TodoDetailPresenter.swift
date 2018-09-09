//
//  TodoDetailPresenter.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/9/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation

class TodoDetailPresenter {
    
    weak var view:TodoDetailView?
    var router:TodoDetailWireframe?
    var interactor:TodoDetailUseCase?
    
    //Since This Module has only one specific data that needs to be kept(a single Todo data), The Presenter will keep the data that was sent from the router
    let todo:Todo
    init(_ todo:Todo) {
        self.todo = todo
    }
}

extension TodoDetailPresenter: TodoDetailPresentation {
    func onViewDidLoad() {
        guard let todoViewData = self.interactor?.createTodoRepresentationType(todo: todo) else { return }
        self.view?.reload(withTodoData: todoViewData)
    }
}
