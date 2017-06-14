//
//  MainTableViewController+delegate.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/31/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

extension MainTableViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NSNotification.Name.init(NotificationKey.keyboardClick), object: nil)
        return false
    }
}

