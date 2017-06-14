//
//  KeyboardViewController.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 6/4/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func numberPadButtons(_ sender: UIButton) {
        _ = sender.currentTitle
        NotificationCenter.default.post(name: NSNotification.Name.init(NotificationKey.numberPadButtons), object: nil, userInfo: ["titleButton1": sender.currentTitle!])
    }
    
    @IBAction func marksButtons(_ sender: UIButton) {
        _ = sender.currentTitle
        NotificationCenter.default.post(name: NSNotification.Name.init(NotificationKey.marksButtons), object: nil, userInfo: ["titleButton2": sender.currentTitle!])
    }
    @IBAction func finishAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: NotificationKey.finishAction), object: nil, userInfo: ["5": sender.currentTitle!])
    }
    
    @IBAction func cAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: NotificationKey.cAction), object: nil, userInfo: ["5": sender.currentTitle!])
    }
    
    @IBAction func hiddenKeyboard(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationKey.hiddenKeyboard, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

