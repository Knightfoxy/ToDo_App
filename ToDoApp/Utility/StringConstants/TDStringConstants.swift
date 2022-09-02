//
//  TDStringConstants.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import Foundation
import UIKit
// StoryBoard Names
enum StoryBoard : String {
    case main = "Main"
}
// Cells Identifiers
enum Identifiers : String {
    case addUpdateVC = "TDAddUpdateVC"
    case tableCell = "ToDoTableCell"
}
enum Messages : String {
    case decsPlaceholder = "Enter Short Description Of your Work"
}
enum ButtonTitle : String {
    case edit = "Edit"
    case done = "Done"
}
enum Constants : String {
case blank = ""
}
enum DateType : String {
    case string
    case date
}
enum DateFormat : String {
    case yyyyMMdd = "yyyy MM dd"
}
enum EntityName : String {
    case tasks = "Tasks"
}
enum Day : String {
case today = "Today"
}
// Integer Constants Used
enum IntConst : Int {
    case one  = 1
    case cellHeight = 80
}

struct AppCustomColor {
    
    static var addBtn : UIColor { #colorLiteral(red: 0.3607843137, green: 0.6980392157, blue: 0.3803921569, alpha: 1) }
}
