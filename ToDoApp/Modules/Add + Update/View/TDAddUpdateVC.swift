//
//  TDAddUpdateVC.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import UIKit


var insertData : ((TaskInfoModel) -> Void)? = nil
class TDAddUpdateVC: TDBaseVC {
    // MARK: - Stored Properties
    var objTaskModel = TaskInfoModel(title: Constants.blank.rawValue, decsription: Constants.blank.rawValue, date:Date(), id: "")
    var objVM = TDAddEditVM()
    var task = Constants.blank.rawValue
    var desc = Constants.blank.rawValue
    var togglefromEditToDone : Bool = false
    var caseOfEditing : Bool = false
    var date = Date()
    var id = Constants.blank.rawValue
    var manager : TaskManager = TaskManager()
    // MARK: - IBOutlets
    @IBOutlet private(set) weak var taskHeaderLbl: UILabel!
    @IBOutlet private(set) weak var dateTF: UITextField!
    @IBOutlet private(set) weak var editBtn: UIButton!
    @IBOutlet private(set) weak var titleAlertLbl: UILabel!
    @IBOutlet private(set) weak var datePicker: UIDatePicker!
    @IBOutlet private(set) weak var doneBtn: UIButton!
    @IBOutlet private(set) weak var descTextV: UITextView!
    @IBOutlet private(set) weak var titleTF: UITextField!
    // MARK: - Lifecycle Properties
    // initial settings for the view
    override func initialSetup() {
        if caseOfEditing {
            objVM.actionOnEdit(titleTF, descTextV, dateTF, !caseOfEditing)
            self.doneBtn.isHidden = true
        } else {
            self.editBtn.isHidden = true
        }
        self.descTextV.text = Messages.decsPlaceholder.rawValue
        self.descTextV.textColor = UIColor.lightGray
        initialSettings()
        titleTF.text = task
        datePicker.minimumDate = Date()
        descTextV.text = desc
        gestureRecogniser()
        dateTF.text = datePicker.dateFormatterToString(datePicker.date)
    }
    // MARK: - IB Outlets
    // edit Method to do changes in existing Task
    @IBAction private func didTapEdit(_ sender: Any) {
        if togglefromEditToDone == false {
            objVM.actionOnEdit(titleTF, descTextV, dateTF, caseOfEditing)
            self.editBtn.setTitle(ButtonTitle.done.rawValue, for: .normal)
        } else {
            let data = TaskInfoModel(title: titleTF.text!, decsription:descTextV.text , date: date, id: id )
            TaskListOperation.shared.taskList = TaskListOperation.shared.taskList.map({ TaskInfoModel in
                TaskInfoModel.id == id ? data : TaskInfoModel
            })
            manager.updateTask(task: data)
            self.navigationController?.popViewController(animated: true)
        }
        togglefromEditToDone.toggle()
    }
    // saving the task to the list
    @IBAction private func didTapDone(_ sender: Any) {
        if titleTF.text == Constants.blank.rawValue {
            self.alert()
        } else {
            if let title = titleTF.text , let decsription = descTextV.text {
                objTaskModel.date = datePicker.dateFormatterToDate(datePicker.date)
                objTaskModel.decsription = decsription
                objTaskModel.title = title
                objTaskModel.id = UUID().uuidString
                insertData?(objTaskModel)
                self.popFromVC()
            }
        }
    }
    // poping to ToDo list
    @IBAction private func didTapBack(_ sender: Any) {
        self.popFromVC()
    }
    // MARK: - Custom Properties
    func alert() {
        self.titleAlertLbl.isHidden = false
    }
    func popFromVC() {
        navigationController?.popViewController(animated: true)
    }
}
//delegates + initial Settings
extension TDAddUpdateVC : UITextViewDelegate, UITextFieldDelegate {
    func initialSettings() {
        self.descTextV.delegate = self
        self.titleTF.delegate = self
        self.dateTF.delegate = self
        self.datePicker.isHidden = true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.descTextV.text = nil
        self.descTextV.textColor = UIColor.black
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.titleAlertLbl.isHidden = true
        datePicker.isHidden = (textField == dateTF ? false : true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == dateTF {
            self.datePicker.isHidden = true
            let dateString = datePicker.dateFormatterToString(datePicker.date)
            dateTF.text = dateString
            self.view.endEditing(true)
        }
    }
    
}
