//
//  ListPageExtension.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 12/07/22.
//

import Foundation
import UIKit

// table view cell delegates + dataSource
extension ToDoMainVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        blankView.isHidden = ( objListingVM.dateSections.count > 0 ? true : false )
        return objListingVM.dateSections.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objListingVM.removeTask(indexPath)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.yyyyMMdd.rawValue
        dateFormatter.dateStyle = .medium
        if Calendar.current.isDate(objListingVM.dateSections[section], equalTo: Date(), toGranularity: .day) {
            return Day.today.rawValue
        } else {
            let string = dateFormatter.string(from: objListingVM.dateSections[section])
            return string
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objListingVM.getData(section).count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: StoryBoard.main.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: Identifiers.addUpdateVC.rawValue) as! TDAddUpdateVC
        let data = objListingVM.getData(indexPath.section)
        vc.task = data[indexPath.row].title
        vc.desc = data[indexPath.row].decsription
        vc.date = data[indexPath.row].date
        vc.id = data[indexPath.row].id
        vc.caseOfEditing = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = baseTableView.dequeueReusableCell(withIdentifier: Identifiers.tableCell.rawValue, for: indexPath) as! ToDoTableCell
        let data = objListingVM.getData(indexPath.section)
        cell.displayCell(data[indexPath.row])
        return cell
    }
}
extension ToDoMainVC {
    // To register nib for the TableCell
    func registerNibForTableCell(_ identifier : String) {
        let cellNib = UINib(nibName: identifier , bundle: nil)
        baseTableView.register(cellNib, forCellReuseIdentifier: identifier)
    }
    // To navigate to particular viewController
    func navigationVC(_ sbName : String,_ id : String) {
        let sb = UIStoryboard(name: sbName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: id)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
