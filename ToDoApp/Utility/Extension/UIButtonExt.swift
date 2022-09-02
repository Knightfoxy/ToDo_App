//
//  UIButtonExt.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 11/07/22.
//

import Foundation
import UIKit

extension UIButton {
    // To place shadow to the Buttons
    func shadowShades(_ btn : UIButton, _ alpha : Double, _ width :Int , _ height :Int , _ shadowOpacity :Float , _ shadowRadius :Float) {
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOffset = CGSize(width: width, height: height)
        btn.layer.shadowOpacity = shadowOpacity
        btn.layer.shadowRadius = CGFloat(shadowRadius)
    }
}
