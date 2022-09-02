//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 12/07/22.
//

import Foundation
import CoreData

struct TaskManager {
    
    private var _taskRepository = TaskdataRepository()
    var task : [Tasks] = []
    
    func createTask(task: TaskInfoModel) {
        _taskRepository.create(task: task)
    }

    mutating func fetchAllTask() -> [TaskInfoModel]? {
        return _taskRepository.getAll()
    }

    func fetchParticularTask(byIdentifier id: String) -> TaskInfoModel?
    {
        return _taskRepository.get(byIdentifier: id)
    }

    func updateTask(task: TaskInfoModel) -> Bool {
        return _taskRepository.update(task: task)
    }

    func deleteTask(task: TaskInfoModel) -> Bool {
        return _taskRepository.delete(record: task)
    }
}
