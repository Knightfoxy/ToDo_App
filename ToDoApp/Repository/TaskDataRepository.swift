//
//  TaskDataRepository.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 12/07/22.
//

import Foundation
import UIKit
import CoreData

protocol TaskRepository {
    func create(task : TaskInfoModel)
    func getAll() -> [TaskInfoModel]?
    func get(byIdentifier id : String) -> TaskInfoModel?
    func update(task : TaskInfoModel) -> Bool
    func delete(record : TaskInfoModel) -> Bool
}

struct TaskdataRepository : TaskRepository {
    func create(task: TaskInfoModel) {
        let tdTask = Tasks(context: PersistentStorage.shared.context)
        tdTask.taskTitle = task.title
        tdTask.taskDescription = task.decsription
        let date =  TDCommonFunctions.shared.dateFormatterToString(task.date)
        tdTask.taskDate = date
        tdTask.uniqueId = task.id
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [TaskInfoModel]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: Tasks.self)
        var tasksForTheDay : [TaskInfoModel] = []
        result?.forEach({tdTask in
            
            guard let str = tdTask.taskDate else {return}
            guard let desc = tdTask.taskDescription else {return}
            guard let title = tdTask.taskTitle else {return}
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let date = dateFormatter.date(from: str)
            let task = TaskInfoModel(title:title , decsription: desc, date: date ?? Date(), id: tdTask.uniqueId!)
            tasksForTheDay.append(task)
        })
        return tasksForTheDay
    }
    
    func get(byIdentifier id: String) -> TaskInfoModel? {
        
        let result = getTasks(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToTask()
    }
    
    func update(task: TaskInfoModel) -> Bool {
        let tdTask = getTasks(byIdentifier: task.id)
        guard  tdTask != nil else {return false}
        tdTask?.taskTitle = task.title
        tdTask?.taskDescription = task.decsription
        tdTask?.taskDate = TDCommonFunctions.shared.dateFormatterToString(task.date)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(record: TaskInfoModel) -> Bool {
        let tdTask = getTasks(byIdentifier: record.id)
        PersistentStorage.shared.context.delete(tdTask ?? Tasks())
        PersistentStorage.shared.saveContext()
        return true
    }
    
    private func getTasks(byIdentifier id : String) -> Tasks? {
        let fetchRequest = NSFetchRequest<Tasks>(entityName: "Tasks")
        print("fetch ---" , fetchRequest , "-------")
        let predicate = NSPredicate( format: "%K == %@",#keyPath(Tasks.uniqueId), id)
        fetchRequest.predicate = predicate
        PersistentStorage.shared.saveContext()
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
