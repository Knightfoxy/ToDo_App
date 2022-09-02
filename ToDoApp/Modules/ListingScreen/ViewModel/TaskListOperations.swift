//
//  TaskListOperations.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 08/07/22.
//

import Foundation

class TaskListOperation {
    
    static var shared = TaskListOperation()
    var taskList : [TaskInfoModel] = []
    
    func appendData(_ data : TaskInfoModel) {
        taskList.append(data)
    }
    func deleteData( _ index : Int) {
        taskList.remove(at: index)
    }
    func updateData(_ index : Int , _ data : TaskInfoModel) {
        taskList[index] = data
    }
}
