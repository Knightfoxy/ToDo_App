//
//  Tasks+CoreDataProperties.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 12/07/22.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var taskDate: String?
    @NSManaged public var taskDescription: String?
    @NSManaged public var taskTitle: String?
    @NSManaged public var uniqueId: String?

}

extension Tasks : Identifiable {
    func convertToTask() -> TaskInfoModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        let str = self.taskDate ?? ""
        let date = dateFormatter.date(from: str)
        return TaskInfoModel(title:self.taskTitle ?? "" , decsription: self.taskDescription ?? "", date:date ?? Date(), id: "")
    }
}
