//
//  TDCommonFunctions.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import Foundation
import UIKit
 
class TDCommonFunctions {
    static var shared = TDCommonFunctions()
    func dateFormatterToString(_ date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        dateFormatter.dateStyle = .short
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
    func dateFormatterToDate(_ date : Date) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        dateFormatter.dateStyle = .short
        let newdatw = dateFormatter.string(from: date)
        guard let newdate = dateFormatter.date(from:newdatw) else { return Date()}
        return newdate
    }
}
