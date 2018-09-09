//
//  TodoRouter.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/8/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import Foundation
import UIKit

class TodoRouter {
    
    weak var vc:UIViewController?
    
    static func create() -> UINavigationController? {
        
        print("Router: I'm setting things up!")
        
        guard let navView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNav") as? UINavigationController, let view = navView.viewControllers.first as? TodoViewController else {
            return nil;
        }
        let presenter = TodoPresenter()
        let router = TodoRouter()
        let interactor = TodoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.vc = view
        
        interactor.output = presenter
        
        return navView
    }
}

extension TodoRouter: TodoRouteProtocol {
    func moveToAddScreen() {
    }
    
    func moveToTodoDetail(withTodo todo:Todo) {
        guard let vc = self.vc, let detailView = TodoDetailRouter.create(withTodo: todo) else { return }
        vc.navigationController?.pushViewController(detailView, animated: true)
    }

}
