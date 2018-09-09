//
//  TodoDetailRouter.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/9/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation
import UIKit

class TodoDetailRouter {
    
    weak var vc:TodoDetailViewController? = nil
    
    static func create(withTodo todo:Todo) -> UIViewController? {
        
        print("Router: I'm setting things up!")
        
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodoDetailViewController") as? TodoDetailViewController else {
            return nil;
        }
        let router = TodoDetailRouter()
        let presenter = TodoDetailPresenter(todo)
        let interactor = TodoDetailInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        router.vc = view
        
        return view
    }
}

extension TodoDetailRouter: TodoDetailWireframe {
    
}
