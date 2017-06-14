//
//  Constant.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/31/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import Foundation
struct NotificationKey {
    static let menuClick = "menuClick"
    static let keyboardClick = "keyboardClik"
    static let hiddenKeyboard = Notification.Name.init("hiddenKeyboard")
    static let cAction = "CAction"
    static let finishAction = "finishAction"
    static let marksButtons = "marksButtons"
    static let numberPadButtons = "numberPadButtons"
    static let hideSideMenu = Notification.Name.init("hideSideMenu")
}
struct SegueIdentifier {
    static let PageVC = "PageVC"
    static let SideMenuVC = "SideMenuVC"
}
