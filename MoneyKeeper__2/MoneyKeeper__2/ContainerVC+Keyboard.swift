//
//  ContainerVC+Keyboard.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/31/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit
extension ContainerVC {
    func setStageKeyboard(isKeyboard: Bool) {
        UIView.animate(withDuration: 0.35, animations: {
            self.bottomKeyboardConstraint.constant = self.isKeyboardOpen ? 50 : -self.keyboardViewContainer.bounds.height
            self.view.layoutIfNeeded()
        })
    }
    
    func closeKeyboard() {
        isKeyboardOpen = false 
    }
    
    func changeKeyboard() {
        isKeyboardOpen = !isKeyboardOpen
    }
    
}
