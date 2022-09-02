//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import UIKit

class ToDoMainVC: TDBaseVC {
    // MARK: - Stored Properties
    var objListingVM = TDListingVM()
    // MARK: - IB Outlets
    @IBOutlet private(set) weak var addBtnOutlet: UIButton!
    @IBOutlet private(set) weak var blankView: UIView!
    @IBOutlet private(set) weak var baseTableView: UITableView!
    // MARK: - Lifecycle Methods
    override func initialSetup() {
        self.baseTableView.dataSource = self
        self.baseTableView.delegate = self
        self.baseTableView.allowsMultipleSelectionDuringEditing = false
        addBtnOutlet.backgroundColor = AppCustomColor.addBtn
        self.registerNibForTableCell(Identifiers.tableCell.rawValue)
        addBtnOutlet.shadowShades(addBtnOutlet, 4, 0, 4, 5, 6)
        objListingVM.fetchAllData()
        insertData = { [self] data in
            objListingVM.appendData(data)
            objListingVM.createSingleTask(data)
            baseTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        objListingVM.mappingTaskListArray()
        baseTableView.reloadData()
    }
    // MARK: - IB Actions
    //On taping Add Task navigates to Add Page
    @IBAction private func didTapAdd(_ sender: Any) {
        self.navigationVC(StoryBoard.main.rawValue,Identifiers.addUpdateVC.rawValue)
    }
}
