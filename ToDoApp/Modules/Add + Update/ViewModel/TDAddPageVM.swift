//
//  TDAddPageVM.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 11/07/22.
//

import Foundation
import UIKit

class TDAddEditVM {
    var manager = TaskManager()
    func actionOnEdit(_ titleTF : UITextField,_ descTextV : UITextView,_ dateTF : UITextField,_ flag : Bool) {
        titleTF.isUserInteractionEnabled = flag
        descTextV.isUserInteractionEnabled = flag
        dateTF.isUserInteractionEnabled = flag
        if flag {
            titleTF.borderStyle = .roundedRect
            dateTF.borderStyle = .roundedRect
        } else {
            titleTF.borderStyle = .none
            dateTF.borderStyle = .none
        }
    }
}
