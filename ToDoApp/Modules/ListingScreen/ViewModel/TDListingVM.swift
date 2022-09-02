//
//  TDListingVM.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import Foundation
import UIKit
import CoreData

class TDListingVM {
    var arrayOfTasksSort : [TaskInfoModel] = []
    var dateSections : [Date] = []
    var dictOfTaskEachSection = [Date:[TaskInfoModel]]()
    var userDetail : [NSManagedObject] = []
    var mytaskList : [TaskInfoModel] = []
    var manager  = TaskManager()
    func initialActionOnEdit(_ titleTF : UITextField,_ descTextV : UITextView,_ dateTF : UITextField,_ flag : Bool,_ editBtn : UIButton,_ doneBtn: UIButton) {
        
    }
    func removeTask(_ index : IndexPath) {
        let data = getData(index.section)
        let task = data[index.row]
        var counter = 0
        for item in TaskListOperation.shared.taskList {
            if item.id == task.id {
                TaskListOperation.shared.taskList.remove(at: counter)
                //id check and send entity to delete .....
                manager.deleteTask(task: task)
                mappingTaskListArray()
            }
            counter += 1
        }
    }
    func fetchAllData() {
        if let fetchedData = manager.fetchAllTask() {
        print("-----" , fetchedData , "-----")
        TaskListOperation.shared.taskList = fetchedData
        
        }
    }
    func createSingleTask(_ data : TaskInfoModel) {
        manager.createTask(task: data)
    }
    func getDataCount() -> Int {
        return dictOfTaskEachSection.count
    }
    func getData( _ section : Int) -> [TaskInfoModel] {
        return dictOfTaskEachSection[dateSections[section]]!
    }
    func appendData(_ data : TaskInfoModel) {
        TaskListOperation.shared.appendData(data)
    }
    func mappingTaskListArray() {
        arrayOfTasksSort =  TaskListOperation.shared.taskList
        dateSections = Array(Set(TaskListOperation.shared.taskList.compactMap({($0.date)})))
        dateSections = dateSections.sorted{$0 < $1}
        dateSections.forEach({
            dictOfTaskEachSection[$0] = [TaskInfoModel]()
        })
        arrayOfTasksSort.forEach({
            dictOfTaskEachSection[($0.date)]?.append($0 )
        })
        print(dictOfTaskEachSection)
    }
}

