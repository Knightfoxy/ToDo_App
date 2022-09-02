//
//  TDBaseVC.swift
//  ToDoApp
//
//  Created by Ayush Mishra on 07/07/22.
//

import UIKit

class TDBaseVC: UIViewController {
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    // dismising the keyboard on tapping around
    @objc func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self , action: #selector(dismissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    // poping the vc on right Swipe recoginising
    @objc func swipedright() {
        self.navigationController?.popViewController(animated: true)
    }
    // for checking the gesture
    func gestureRecogniser() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedright))
        swipeRight.direction  = .right
        self.view.addGestureRecognizer(swipeRight)
    }
}
extension TDBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        hideKeyboardWhenTappedAround()
    }
    @objc func initialSetup() {
        // Initial setup for the class, is called in view did load and View will appear.
    }
}
