//
//  ContainerVC+SideMenu.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/30/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

extension ContainerVC {
   
    func setStageSideMenu (isSideMenu: Bool) {
        UIView.animate(withDuration: 0.35, animations: {
            self.topSideMenuConstraint.constant = isSideMenu ? 0 : -self.sideMenuViewContainer.bounds.height
            self.coverButton.alpha = isSideMenu ? 0.5 : 0
            self.view.layoutIfNeeded()
        }) { (isSuccess) in
            
        }
    }
    @IBAction func onClickSideMenu(_ sender: UIButton) {
        isSideMenuOpen = !isSideMenuOpen
    }
    
    func hidenSideMenu() {
        isSideMenuOpen  = false
    }

    
}

extension ContainerVC: SideMenuTableViewControllerProtocol {
    func passData(index: Int) {
        switch index {
        case 1:
            pageVC?.jump(toIndex: 0)
        case 2:
            pageVC?.jump(toIndex: 1)
        case 3:
            pageVC?.jump(toIndex: 2)
        case 4:
            pageVC?.jump(toIndex: 3)
        default:
            return
        }
    }
    func passName(name: String) {
        SideMenuButton.setTitle(name, for: .normal)
    }
}
