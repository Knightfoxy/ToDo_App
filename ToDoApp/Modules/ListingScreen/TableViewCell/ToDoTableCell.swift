//
//  ToDoTableCell.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import UIKit

class ToDoTableCell: UITableViewCell {

    @IBOutlet private(set) weak var titleLbl: UILabel!
    @IBOutlet private(set) weak var shortDecsLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func displayCell(_ data : TaskInfoModel) {
        titleLbl.text = data.title
        shortDecsLbl.text = data.decsription
    }
}
