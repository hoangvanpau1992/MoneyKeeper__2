//
//  SideMenuTableViewController.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/31/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit
protocol SideMenuTableViewControllerProtocol {
    func passData(index: Int)
    func passName(name: String)
}

class SideMenuTableViewController: UITableViewController {
    
     var delegate: SideMenuTableViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NotificationKey.hideSideMenu, object: nil)
        NotificationCenter.default.post(name: NotificationKey.hiddenKeyboard, object: nil)

        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text
        delegate?.passName(name: text ?? "")
        switch indexPath.row {
        case 0:
            delegate?.passData(index: 1)
        case 1:
            delegate?.passData(index: 2)
        case 2:
            delegate?.passData(index: 3)
        case 3:
            delegate?.passData(index: 4)
        default:
            return
        }
        
        
    }

   

}
