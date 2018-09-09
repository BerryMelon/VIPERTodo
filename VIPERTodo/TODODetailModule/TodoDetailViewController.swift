//
//  TodoDetailViewController.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/9/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    var presenter:TodoDetailPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.onViewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TodoDetailViewController:TodoDetailView {
    func reload(withTodoData todoData: TodoRepresentType) {
        self.todoTitleLabel.text = todoData.todo
        self.dueDateLabel.text = todoData.dueDate
    }

}
