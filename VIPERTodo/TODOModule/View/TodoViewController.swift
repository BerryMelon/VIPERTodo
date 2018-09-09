//
//  TodoViewController.swift
//  VIPERTodo
//
//  Created by Doheny Yoon on 9/8/18.
//  Copyright © 2018 Doheny Yoon. All rights reserved.
//

import UIKit


private enum Constants {
    static let CellIdentifier = "Cell"
}

class TodoViewController: UIViewController {

    var presenter:TodoPresentation?
    //Some variables required to present Views
    var numberOfRows:Int = 0
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.onViewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
}

extension TodoViewController: TodoView {
    func reload(numberOfRows:Int) {
        self.numberOfRows = numberOfRows
        self.tableView.reloadData()
    }
}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let todoData = self.presenter?.requestTodo(forIndex: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier) else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = todoData.todo
        cell.detailTextLabel?.text = todoData.dueDate == "" ? "" : "Due Date: " + todoData.dueDate
        cell.accessoryType = todoData.isDone ? UITableViewCellAccessoryType.checkmark : UITableViewCellAccessoryType.none
        
        return cell
    }
}

extension TodoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.onTappedTodo(atIndex: indexPath.row)
    }
}
