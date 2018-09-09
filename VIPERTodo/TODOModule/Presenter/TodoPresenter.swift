//
//  TodoPresentor.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/8/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation

//View doesn't need to know about the actual data. Presenter will send the data to the view in this format. This way the view can be totally independant with the Todo data and the Interactor, and any Interactor can easily attach to this view if it sends the data in the givin format.
typealias TodoRepresentType = (todo:String,isDone:Bool,dueDate:String)

class TodoPresenter {

    weak var view: TodoView?
    var router:TodoRouteProtocol?
    var interactor:TodoUseCase?
}

extension TodoPresenter:TodoPresentation {
    func requestTodo(forIndex index: Int) -> TodoRepresentType? {
        guard let todo = self.interactor?.getTodo(fromIndex: index), let todoRepresentationData = self.interactor?.createTodoRepresentationType(todo: todo) else { return nil }
        
        return todoRepresentationData
        
        // Presenter can modify some of the data here to require what the view wants. If it has complicated logics involved, Interactor can do this task instead.
        /**
         ** *UPDATE* after implementing the TODODetailModule, I realised that DetailModule also has to make this representtype from the presenter. Now since this task (even though it is simple now) is not only used here, we will have to move this to the interactor, and the interactor will use a global worker protocol to use it.
        let todoStr = todo.text
        let isDone = todo.isDone
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateStr = todo.dueDate == nil ? "" : dateFormatter.string(from: todo.dueDate!)
        return TodoRepresentType(todoStr,isDone,dateStr)
         **/
    }
    
    var tableViewCount: Int {
        get {
            return self.interactor?.numberOfTodos() ?? 0
        }
    }
    
    func onTappedAddButton() {
    }
    
    func onTappedTodo(atIndex index:Int) {
        guard let todo = self.interactor?.getTodo(fromIndex: index) else {
            return
        }
        
        self.router?.moveToTodoDetail(withTodo: todo)
    }
    
    func onViewDidLoad() {
        interactor?.fetchTodos()
    }

}

extension TodoPresenter:TodoInteractorOutput {
    func didFetchTodo(totalCount: Int) {
        view?.reload(numberOfRows: totalCount)
    }
}
