//
//  ToDoModel.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import Foundation
struct TaskInfoModel {
    var title : String
    var decsription : String
    var date : Date
    var id : String
}
enum ActionType : String {
    case create
    case update
}
